document.addEventListener('turbo:load', () => {
  document.getElementById('toggle-preparation1').addEventListener('click', () => {
    // 表示/非表示を切り替える要素を取得
    const preparationContent1 = document.getElementById('preparation-content1');
    // hiddenクラスの付け外し
    preparationContent1.classList.toggle('hidden');
  });

  document.getElementById('toggle-preparation2').addEventListener('click', () => {
    // 表示/非表示を切り替える要素を取得
    const preparationContent1 = document.getElementById('preparation-content2');
    // hiddenクラスの付け外し
    preparationContent1.classList.toggle('hidden');
  });
});
