
const tournamentsCardsHover = () => {
  const tournamentCards = document.querySelectorAll('.tournament-card');
  tournamentCards.forEach((card) => {
    card.addEventListener('mouseover', (e) => {
      const imgUrl = card.dataset.imgUrl;
      card.style.backgroundImage = `linear-gradient(142deg, rgba(3,56,96,1) 0%, rgba(3,56,96,0.8897934173669468) 50%, rgba(3,56,96,0.6685049019607843) 100%), url(${imgUrl})`;
    });

    card.addEventListener('mouseout', (e) => {
      const imgUrl = card.dataset.imgUrl;
      card.style.backgroundImage = `linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)), url(${imgUrl})`;
    });
  });
}

export { tournamentsCardsHover }
