import React, { useEffect, useRef } from 'react';
import gsap from 'gsap';

export default function FreeShippingMessage() {
  const ref = useRef(null);

  const shoes = [
    'https://cdn.pixabay.com/photo/2023/05/03/22/43/tennis-7968714_640.png',
    'https://cdn.pixabay.com/photo/2014/04/03/10/38/sneakers-310941_640.png',
    'https://cdn.pixabay.com/photo/2013/07/12/18/20/shoes-153310_1280.png',
    'https://cdn.pixabay.com/photo/2014/04/02/11/02/sneaker-305322_640.png'
  ];

  useEffect(() => {
    if (!ref.current) return;
    const imgs = ref.current.querySelectorAll('.shoe-item');

    // Hiệu ứng xuất hiện khi load
    gsap.fromTo(
      imgs,
      { y: 30, opacity: 0 },
      { y: 0, opacity: 1, duration: 1, ease: 'power3.out', stagger: 0.12 }
    );

    // Hiệu ứng floating nhẹ (dao động lên xuống)
    imgs.forEach((img, i) => {
      gsap.to(img, {
        y: '+=6',
        repeat: -1,
        yoyo: true,
        ease: 'sine.inOut',
        duration: 2 + i * 0.4, // lệch pha giữa các đôi giày để tự nhiên
      });
    });

    // Hiệu ứng hover (nở nhẹ, không đổ bóng)
    imgs.forEach((img) => {
      const enter = () =>
        gsap.to(img, { scale: 1.2, duration: 0.3, ease: 'power2.out' });
      const leave = () =>
        gsap.to(img, { scale: 1, duration: 0.3, ease: 'power2.inOut' });

      img.addEventListener('mouseenter', enter);
      img.addEventListener('mouseleave', leave);

      // cleanup
      return () => {
        img.removeEventListener('mouseenter', enter);
        img.removeEventListener('mouseleave', leave);
      };
    });
  }, []);

  return (
    <div style={styles.outer}>
      <div ref={ref} style={styles.inner}>
        <style>{`
          .shoe-item {
            height: 100%;
            width: auto;
            cursor: pointer;
            will-change: transform;
            transform-origin: center;
          }
        `}</style>

        {shoes.map((src, i) => (
          <img key={i} src={src} alt={`shoe-${i + 1}`} className="shoe-item" />
        ))}
      </div>
    </div>
  );
}

export const layout = {
  areaId: 'body',
  sortOrder: 0
};

const styles = {
  outer: {
    width: '100%',
    height: '80px', // đủ không gian cho floating và nở
    backgroundColor: '#fff',
    display: 'flex',
    justifyContent: 'center',
    position: 'relative',
    overflow: 'visible',
  },
  inner: {
    height: '50px',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'space-evenly',
    width: '100%',
    gap: '10px',
  },
};
