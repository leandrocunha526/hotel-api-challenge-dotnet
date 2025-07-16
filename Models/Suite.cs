using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace hotel_api_challenge.Models
{
    public class Suite : IAuditable
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "O tipo da suíte é obrigatório.")]
        public required string Type { get; set; }

        [Required(ErrorMessage = "A capacidade da suíte é obrigatória.")]
        [Range(1, int.MaxValue, ErrorMessage = "A capacidade deve ser pelo menos 1.")]
        public int Capacidade { get; set; }

        [Required(ErrorMessage = "O valor da diária é obrigatório.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "O valor da diária deve ser maior que zero.")]
        [Column(TypeName = "decimal(18,2)")]
        public decimal PriceByDay { get; set; }

        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }

        public virtual ICollection<Reservation> Reservations { get; set; } = new List<Reservation>();
    }
}
