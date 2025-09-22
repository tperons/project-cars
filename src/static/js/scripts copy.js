// Aguarda o carregamento completo do HTML antes de executar o script
document.addEventListener("DOMContentLoaded", function () {
    // Elementos da galeria
    const mainImage = document.getElementById("mainCarImage");
    const prevButton = document.getElementById("prevImageBtn");
    const nextButton = document.getElementById("nextImageBtn");
    const thumbnailContainer = document.getElementById("thumbnail-container");

    // Verifica se os elementos da galeria existem na página
    if (!mainImage || !thumbnailContainer) {
        return; // Sai da função se não estiver na página de detalhe
    }

    const thumbnails = thumbnailContainer.querySelectorAll("img");

    // 1. Cria a lista de todas as imagens, começando com a imagem de capa.
    // O 'mainImage.src' garante que a imagem de capa é a primeira da lista.
    const galleryImages = [
        mainImage.src,
        ...Array.from(thumbnails).map((thumb) => thumb.src),
    ];
    let currentImageIndex = 0;

    // Função para atualizar a imagem principal e destacar a miniatura
    function updateGallery(index) {
        // Proteção para garantir que o índice é válido
        if (index < 0 || index >= galleryImages.length) {
            return;
        }

        mainImage.src = galleryImages[index];
        currentImageIndex = index;

        // Atualiza a classe 'active' nas miniaturas
        thumbnails.forEach((thumb, i) => {
            // O índice da miniatura 'i' corresponde ao índice 'i+1' na galeria,
            // porque a imagem de capa está no índice 0.
            if (i + 1 === index) {
                thumb.classList.add("active");
            } else {
                thumb.classList.remove("active");
            }
        });

        // Se a imagem de capa (índice 0) estiver ativa, remove o destaque de todas as miniaturas
        if (index === 0) {
            thumbnails.forEach((thumb) => thumb.classList.remove("active"));
        }
    }

    // Função para mostrar a próxima imagem
    function showNextImage() {
        if (galleryImages.length === 0) return;
        const nextIndex = (currentImageIndex + 1) % galleryImages.length;
        updateGallery(nextIndex);
    }

    // Função para mostrar a imagem anterior
    function showPreviousImage() {
        if (galleryImages.length === 0) return;
        const prevIndex =
            (currentImageIndex - 1 + galleryImages.length) %
            galleryImages.length;
        updateGallery(prevIndex);
    }

    // Adiciona os eventos de clique aos botões
    if (prevButton && nextButton) {
        prevButton.addEventListener("click", showPreviousImage);
        nextButton.addEventListener("click", showNextImage);
    }

    // Adiciona o evento de clique a cada miniatura
    thumbnails.forEach((thumb, index) => {
        thumb.addEventListener("click", () => {
            // O índice na galeria é o índice da miniatura + 1, pois a capa é o índice 0.
            updateGallery(index + 1);
        });
    });

    // Inicia a galeria
    if (galleryImages.length > 0) {
        updateGallery(0);
    }
});
