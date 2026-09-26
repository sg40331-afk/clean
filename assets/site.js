document.addEventListener('DOMContentLoaded',()=>{
  const menuButton=document.querySelector('.hamb');
  const mobileMenu=document.querySelector('#mobile');
  if(menuButton&&mobileMenu){
    menuButton.addEventListener('click',()=>{
      const open=mobileMenu.classList.toggle('open');
      menuButton.setAttribute('aria-expanded',String(open));
    });
  }

  const fieldMain=document.querySelector('#fieldMain');
  const tabs=[...document.querySelectorAll('.ba-tab')];
  const items=[...document.querySelectorAll('.change-list .fieldbtn')];
  let currentItem=items[0]||null;

  function setTabs(mode){
    tabs.forEach(tab=>{
      const active=tab.dataset.ba===mode;
      tab.classList.toggle('active',active);
      tab.setAttribute('aria-selected',String(active));
    });
  }

  function showImage(src, alt){
    if(!fieldMain||!src) return;
    fieldMain.style.opacity='.2';
    window.setTimeout(()=>{
      fieldMain.src=src;
      fieldMain.alt=alt||'청소 작업 전후 이미지';
      fieldMain.style.opacity='1';
    },120);
  }

  tabs.forEach(tab=>{
    tab.addEventListener('click',()=>{
      if(!currentItem) return;
      const mode=tab.dataset.ba;
      const src=currentItem.dataset[mode];
      if(!src) return;
      setTabs(mode);
      showImage(src, `${currentItem.dataset.title||'청소'} ${tab.textContent} 통이미지`);
    });
  });

  items.forEach(item=>{
    item.addEventListener('click',()=>{
      currentItem=item;
      items.forEach(btn=>btn.classList.remove('active'));
      item.classList.add('active');
      setTabs('after');
      showImage(item.dataset.after, `${item.dataset.title||'청소'} 작업 후 통이미지`);
    });
  });

  if(currentItem){
    currentItem.classList.add('active');
    setTabs('after');
  }
});
