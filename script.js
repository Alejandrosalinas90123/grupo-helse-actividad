const botonesFase = document.querySelectorAll('[data-fase]');
const panelesFase = document.querySelectorAll('.panelFase');
const rueda = document.querySelector('.rueda');

botonesFase.forEach((boton) => {
  boton.addEventListener('click', () => {
    botonesFase.forEach((item) => {
      item.classList.remove('activo');
      item.setAttribute('aria-selected', 'false');
    });
    panelesFase.forEach((panel) => {
      panel.classList.remove('activo');
      panel.hidden = true;
    });
    boton.classList.add('activo');
    boton.setAttribute('aria-selected', 'true');
    document.querySelectorAll(`.rueda [data-fase]`).forEach((item) => item.classList.toggle('activo', item.dataset.fase === boton.dataset.fase));
    rueda.dataset.activa = boton.dataset.fase.replace('fase', '');
    const panel = document.getElementById(boton.dataset.fase);
    panel.hidden = false;
    panel.classList.add('activo');
  });
});

document.querySelectorAll('[data-concepto]').forEach((boton) => {
  boton.addEventListener('click', () => {
    const detalle = document.getElementById(boton.dataset.concepto);
    detalle.open = true;
    detalle.scrollIntoView({ behavior: 'smooth', block: 'center' });
  });
});
