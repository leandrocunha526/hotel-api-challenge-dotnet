# 🏨 Sistema de Reservas de Hotel

## 📚 Descrição do projeto

**ATENÇÃO: Este projeto é um projeto de estudo e o conteúdo pode ser modificado seguindo boas práticas de desenvolvimento (não está pronto).**

Este é um projeto de **API RESTful**, desenvolvido em **ASP.NET Core 9**, utilizando **Entity Framework Core 9** com persistência no **SQL Server**.  
O objetivo é gerenciar o processo de hospedagem em um hotel, permitindo o controle de hóspedes, suítes e reservas.

---

## ⚙️ Funcionalidades principais

✅ Cadastro e consulta de hóspedes (Pessoa)  
✅ Cadastro e consulta de suítes (Suite)  
✅ Cadastro de reservas (Reserva), associando hóspedes a uma suíte  
✅ Cálculo do valor total da reserva com desconto automático de 10% para estadias iguais ou superiores a 10 dias  
✅ Validação para impedir reservas com número de hóspedes superior à capacidade da suíte  
✅ Persistência completa dos dados no SQL Server via Entity Framework Core  
✅ Informa na rota de suítes quando há reserva nos dias atuais usando inner join do SQL  
✅ Adiciona ambientes isolados de teste e desenvolvimento para seguir boas práticas de ambientes com mais 1 alternativa de banco de dados  

---

## 🏗️ Estrutura do projeto

- **Pessoa**  
  - Nome e sobrenome do hóspede.
- **Suite**  
  - Tipo da suíte, capacidade máxima de hóspedes e valor da diária.
- **Reserva**  
  - Dias reservados, hóspedes associados e a suíte escolhida.

---

## 💻 Tecnologias utilizadas

- [.NET 9 (ASP.NET Core Web API)](https://dotnet.microsoft.com/)  
- [Entity Framework Core 9](https://docs.microsoft.com/ef/core)  
- [SQL Server](https://www.microsoft.com/sql-server)  
- Swagger (para testes dos endpoints REST)  
- C#
- SQLite

---

## 🚀 Como executar o projeto

Gere as migrations do Entity Framework Core e aplique-as ao banco de dados SQL Server.

```bash
dotnet ef migrations add InitialCreate
```

Certifique-se de que o SQL Server esteja em execução e que a string de conexão no arquivo `appsettings.json` esteja configurada corretamente para apontar para o seu banco de dados.

Depois, atualize o banco de dados com as migrations criadas:

```bash
dotnet ef database update
```

Para usar o ambiente de teste:

```bash
export ASPNETCORE_ENVIRONMENT=Test
```

Uso de gerador de código via aspnet-codegenerator ou via VS IDE, exemplo:

```bash
dotnet aspnet-codegenerator controller -name ReservationController -async -api -m Reservation -dc DataContext -outDir Controllers
```

NOTE: Os arquivos foram alterados seguindo a necessidade do projeto.

## Regras de negócio

Há um desconto inserido para reservas de 10 dias ou mais de 10% de desconto sendo adicionado ao inserir reserva de hotel.

Implementando SQL Inner Join no SQL Server para verificação de reserva dentro do período de check in/check out:

```sql
SELECT
    s.Id AS SuiteId,
    s.Tipo,
    s.Capacidade,
    s.PriceByDay,
    r.Id AS ReservationId,
    r.CheckInDate,
    r.CheckOutDate
FROM
    Suites s
INNER JOIN
    Reservations r ON r.SuiteId = s.Id
WHERE
    r.CheckInDate <= GETDATE()
    AND r.CheckOutDate >= GETDATE()
ORDER BY r.SuiteId ASC
```

Para cálculo usando o banco de dados:

Usando functions:

```sql
CREATE FUNCTION dbo.CalcularTotalComDesconto
(
    @CheckIn DATE,
    @CheckOut DATE,
    @PrecoPorDia DECIMAL(10, 2)
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @Dias INT = DATEDIFF(DAY, @CheckIn, @CheckOut)
    DECLARE @TotalPrice DECIMAL(10, 2)

    IF @Dias >= 10
        SET @TotalPrice = @Dias * @PrecoPorDia * 0.9
    ELSE
        SET @TotalPrice = @Dias * @PrecoPorDia

    RETURN @TotalPrice
END
```

Pode usar com o exemplo: `SELECT dbo.CalcularTotalComDesconto('2025-08-01', '2025-08-11', 150.00) AS TotalComDesconto` ou:

```sql
DECLARE @CheckIn DATE = '2025-08-01';
DECLARE @CheckOut DATE = '2025-08-12';
DECLARE @PrecoPorDia DECIMAL(10,2) = 150.00;

SELECT dbo.CalcularTotalComDesconto(@CheckIn, @CheckOut, @PrecoPorDia) AS TotalComDesconto;
```

Perfeito para simulações.

Para obter com as informações salvas em banco de dados, use:

```sql
SELECT 
    r.Id AS ReservationId,
    r.PersonId,
    r.SuiteId,
    r.CheckInDate,
    r.CheckOutDate,
    s.PriceByDay,
    DATEDIFF(DAY, r.CheckInDate, r.CheckOutDate) AS Dias,
    dbo.CalcularTotalComDesconto(r.CheckInDate, r.CheckOutDate, s.PriceByDay) AS TotalCalculado,
    CASE 
        WHEN DATEDIFF(DAY, r.CheckInDate, r.CheckOutDate) >= 10 THEN 'Desconto aplicado'
        ELSE 'Sem desconto'
    END AS Observacao
FROM Reservations r
JOIN Suites s ON r.SuiteId = s.Id
WHERE DATEDIFF(DAY, r.CheckInDate, r.CheckOutDate) >= 10;
```

Usando Trigger:

```sql
CREATE TRIGGER trg_InserirReservaComDesconto
ON Reservations
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Reservations (PersonId, SuiteId, CheckInDate, CheckOutDate, CreatedAt, UpdatedAt, TotalPrice)
    SELECT 
        i.PersonId,
        i.SuiteId,
        i.CheckInDate,
        i.CheckOutDate,
        i.CreatedAt,
        i.UpdatedAt,
        CASE 
            WHEN DATEDIFF(DAY, i.CheckInDate, i.CheckOutDate) >= 10
                THEN DATEDIFF(DAY, i.CheckInDate, i.CheckOutDate) * s.PriceByDay * 0.9
            ELSE DATEDIFF(DAY, i.CheckInDate, i.CheckOutDate) * s.PriceByDay
        END AS TotalPrice
    FROM inserted i
    JOIN Suites s ON s.Id = i.SuiteId;
END
```

Ao fornecer o comando:

```sql
select * from Reservations
```

Deve exibir o campo "TotalPrice" já calculado após inserts.

**Atenção**:

- Use a trigger apenas para cenários onde você controla totalmente a inserção, como ambientes internos ou testes manuais.

- **NOTE**: se sua API já estiver tratando o campo TotalPrice, desative a trigger ou use uma abordagem com AFTER INSERT e atualize o campo.

- Teste bem antes de usar em produção.

## TODO

- [ ] Adicionar autenticação (ROLES: ADMIN/CLIENTE) (PENDENTE)
- [ ] Adicionar testes automatizados (PENDENTE)
- [ ] Ajustes nas regras de negócio que estão presentes no controller que deverão ser refatoradas (isso pode atrapalhar testes automatizados e a forma que foi implementado seria para testes manuais) seguindo questão de SRP e deve conter as regras em um service (PENDENTE)
