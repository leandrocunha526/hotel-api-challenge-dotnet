using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace hotel_api_challenge.Models
{
    public class Reservation : IAuditable
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "A data de check-in é obrigatória.")]
        public DateTime CheckInDate { get; set; }

        [Required(ErrorMessage = "A data de check-out é obrigatória.")]
        public DateTime CheckOutDate { get; set; }

        [Required(ErrorMessage = "O ID da pessoa é obrigatório.")]
        [Range(1, int.MaxValue, ErrorMessage = "O ID da pessoa deve ser maior que zero.")]
        public int PersonId { get; set; }

        [Required(ErrorMessage = "O ID da suíte é obrigatório.")]
        [Range(1, int.MaxValue, ErrorMessage = "O ID da suíte deve ser maior que zero.")]
        public int SuiteId { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal TotalPrice { get; set; }

        [NotMapped]
        [Column(TypeName = "decimal(18,2)")]
        public decimal DiscountPercentage { get; set; } = 10m;

        [NotMapped]
        [Column(TypeName = "decimal(18,2)")]
        public decimal FinalPrice
        {
            get
            {
                var days = (CheckOutDate - CheckInDate).Days;
                if (days < 1 || Suite == null) return 0;

                var total = days * Suite.PriceByDay;

                // Aplica desconto se a reserva for de 10 dias ou mais
                if (days >= 10)
                {
                    var discountFactor = (100 - DiscountPercentage) / 100;
                    total *= discountFactor;
                }

                return total;
            }
        }

        public virtual Person? Person { get; set; }
        public virtual Suite? Suite { get; set; }

        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
}
