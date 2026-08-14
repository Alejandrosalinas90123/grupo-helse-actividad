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
    panel.querySelectorAll('details').forEach((detalle) => { detalle.open = false; });
    panel.hidden = false;
    panel.classList.add('activo');
    if (boton.dataset.fase === 'fase3') {
      document.body.classList.remove('recorridoPendiente');
    }
  });
});

document.querySelectorAll('[data-concepto]').forEach((boton) => {
  boton.addEventListener('click', () => {
    const detalle = document.getElementById(boton.dataset.concepto);
    detalle.open = true;
    detalle.scrollIntoView({ behavior: 'smooth', block: 'center' });
  });
});

window.diagramasListos.then((diagramas) => {
  document.querySelectorAll('img[data-diagrama]').forEach((imagen) => {
    imagen.src = diagramas[imagen.dataset.diagrama];
  });
}).catch(() => {
  document.querySelectorAll('img[data-diagrama]').forEach((imagen) => imagen.classList.add('cargaAlterna'));
});

document.querySelectorAll('[data-ir-fase]').forEach((boton) => {
  boton.addEventListener('click', () => {
    const destino = boton.dataset.irFase;
    document.querySelectorAll(`[data-fase="${destino}"]`).forEach((item) => {
      item.disabled = false;
      const estado = item.querySelector('small');
      if (estado) estado.textContent = destino === 'fase2' ? 'Fase lógica · disponible' : 'Fase física · disponible';
    });
    const selector = document.querySelector(`.botonesFase [data-fase="${destino}"]`);
    selector.click();
    document.querySelector('.selectorFases').scrollIntoView({ behavior: 'smooth', block: 'start' });
  });
});
