library(ggplot2)
library(ggtext)

# Paleta personalizada
cols <- c(
  "setosa"     = "#E63946",
  "versicolor" = "#457B9D",
  "virginica"  = "#2A9D8F"
)

ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species, fill = Species)) +
  
  # Área de fondo suave por especie (convex hull opcional, aquí usamos elipses)
  stat_ellipse(aes(fill = Species), geom = "polygon",
               alpha = 0.08, linewidth = 0, level = 0.85) +
  
  # Puntos con borde blanco para legibilidad
  geom_point(shape = 21, size = 3.2, stroke = 0.6,
             color = "white", aes(fill = Species), alpha = 0.9) +
  
  # Línea de tendencia suave por especie
  geom_smooth(method = "lm", se = FALSE,
              linewidth = 0.7, linetype = "dashed", alpha = 0.6) +
  
  scale_color_manual(values = cols) +
  scale_fill_manual(values = cols) +
  
  labs(
    title    = "Iris Dataset — Sepal vs Petal Length",
    subtitle = "Cada elipse encierra ~85% de los puntos de cada especie",
    x        = "Sepal Length (cm)",
    y        = "Petal Length (cm)",
    color    = "Species",
    fill     = "Species"
  ) +
  
  theme_minimal(base_family = "Georgia", base_size = 13) +
  theme(
    # Títulos
    plot.title      = element_text(face = "bold", size = 16, margin = margin(b = 6)),
    plot.subtitle   = element_text(color = "grey50", size = 11, margin = margin(b = 16)),
    plot.caption    = element_text(color = "grey65", size = 9),
    
    # Ejes
    axis.title      = element_text(color = "grey30", size = 11),
    axis.text       = element_text(color = "grey45"),
    axis.line       = element_line(color = "grey80", linewidth = 0.4),
    
    # Grid
    panel.grid.major = element_line(color = "grey92", linewidth = 0.4),
    panel.grid.minor = element_blank(),
    
    # Leyenda
    legend.position  = "bottom",
    legend.title     = element_text(face = "bold", size = 10),
    legend.text      = element_text(size = 10),
    legend.key.size  = unit(0.9, "lines"),
    
    # Fondo
    plot.background  = element_rect(fill = "#FAFAF8", color = NA),
    panel.background = element_rect(fill = "#FAFAF8", color = NA),
    plot.margin      = margin(20, 24, 16, 20)
  )