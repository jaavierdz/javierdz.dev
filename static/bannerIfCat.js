document.addEventListener("DOMContentLoaded", function() {
    const urlParams = new URLSearchParams(window.location.search);
    
    // Comprobamos si el usuario viene redirigido desde el dominio .cat
    if (urlParams.get('ref') === 'cat') {
        
        // Creamos el contenedor del banner
        const banner = document.createElement('div');
        banner.id = 'cat-banner';
        banner.innerHTML = `
            <span>Hola! Heu accedit des del domini .cat. Per normativa i per la naturalesa del domini, s´ofereix aquesta web en català. Voleu canviar d'idioma?</span>
            <button id="accept-cat">Sí, veure en català</button>
            <button id="close-cat">&times;</button>
        `;
        
        // Estilos básicos en línea para que aparezca arriba del todo de forma limpia
        banner.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #1a1a1a;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
            z-index: 99999;
            font-family: sans-serif;
            font-size: 14px;
            box-sizing: border-box;
        `;
        
        // Estilos para el botón de acción
        const btnStyle = `
            background-color: #3b82f6;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        `;
        
        document.body.prepend(banner);
        
        // Estilizar los botones internos tras agregarlos
        document.getElementById('accept-cat').style.cssText = btnStyle;
        const closeBtn = document.getElementById('close-cat');
        closeBtn.style.cssText = `
            background: none;
            border: none;
            color: #aaa;
            font-size: 18px;
            cursor: pointer;
            margin-left: 15px;
        `;
        
        // Acción si el usuario acepta ver la versión catalana
        document.getElementById('accept-cat').addEventListener('click', function() {
            // Aquí rediriges a tu subcarpeta o archivo en catalán, ej: /cat/ o /ca/
            window.location.href = "/cat/"; 
        });
        
        // Acción para cerrar el banner si prefiere quedarse en el .es principal
        closeBtn.addEventListener('click', function() {
            banner.remove();
            // Opcional: limpiar la URL para quitar el ?ref=cat sin recargar la página
            window.history.replaceState({}, document.title, window.location.pathname);
        });
    }
});