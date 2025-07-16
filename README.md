# 🏨 Sistema de Reservas de Hotel

## 📚 Descrição do projeto

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
```

## TODO

- [ ] Adicionar autenticação (ROLES: ADMIN/CLIENTE)
- [ ] Adicionar testes automatizados
