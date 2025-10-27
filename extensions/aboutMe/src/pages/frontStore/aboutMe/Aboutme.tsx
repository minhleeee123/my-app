import React, { useEffect, useRef } from 'react';
import { animate, stagger, splitText } from 'animejs';
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { TextPlugin } from 'gsap/TextPlugin';
gsap.registerPlugin(TextPlugin, ScrollTrigger);


// Register GSAP plugin

export default function AboutMe() {
    const containerRef = useRef<HTMLDivElement>(null);
    const nameRef = useRef<HTMLHeadingElement>(null);
    const titleRef = useRef<HTMLParagraphElement>(null);
    const bioRef = useRef<HTMLParagraphElement>(null);

    useEffect(() => {
        // Initialize Anime.js animation for header text
        const { chars } = splitText('#animation-test h2', { words: false, chars: true });

        animate(chars, {
            // Property keyframes
            y: [
                { to: '-2.75rem', ease: 'outExpo', duration: 600 },
                { to: 0, ease: 'outBounce', duration: 800, delay: 100 }
            ],
            // Property specific parameters
            rotate: {
                from: '-1turn',
                delay: 0
            },
            delay: stagger(50),
            ease: 'inOutCirc',
            loopDelay: 1000,
            loop: true
        });

        // GSAP ScrollTrigger Animation for entire page
        if (containerRef.current) {
            // Set initial state - hide entire container
            gsap.set(containerRef.current, {
                opacity: 0,
                y: 50
            });

            // Animate entire page on scroll
            gsap.to(containerRef.current, {
                opacity: 1,
                y: 0,
                duration: 1.2,
                ease: 'power3.out',
                scrollTrigger: {
                    trigger: containerRef.current,
                    start: 'top 80%',
                    end: 'top 20%',
                    toggleActions: 'play none none reverse',
                    scrub: 1,
                    // markers: true, // Uncomment for debugging
                }
            });

            // Additional animation for sections
            const sections = containerRef.current.querySelectorAll('.section');
            sections.forEach((section, index) => {
                gsap.fromTo(
                    section,
                    {
                        opacity: 0,
                        y: 60
                    },
                    {
                        opacity: 1,
                        y: 0,
                        duration: 1,
                        ease: 'power2.out',
                        scrollTrigger: {
                            trigger: section,
                            start: 'top 85%',
                            end: 'top 40%',
                            toggleActions: 'play none none reverse',
                            scrub: 0.8,
                        }
                    }
                );
            });

            // TextPlugin animations for hero section
            // Animation for name (Minh Lê)
            if (nameRef.current) {
                gsap.set(nameRef.current, { text: '' });
                gsap.to(nameRef.current, {
                    duration: 0.8,
                    text: 'Minh Lê',
                    ease: 'none',
                    delay: 0.5,
                });
            }

            // Animation for title
            if (titleRef.current) {
                gsap.set(titleRef.current, { text: '' });
                gsap.to(titleRef.current, {
                    duration: 2.5,
                    text: 'Full-Stack Developer / Software Engineer',
                    ease: 'none',
                    delay: 1.3,
                });
            }

            // Animation for bio - line 1
            if (bioRef.current) {
                const bioLine1 = bioRef.current.querySelector('.bio-line-1');
                const bioLine2 = bioRef.current.querySelector('.bio-line-2');
                
                if (bioLine1) {
                    gsap.set(bioLine1, { text: '' });
                    gsap.to(bioLine1, {
                        duration: 3,
                        text: 'Passionate developer crafting elegant solutions with modern technologies.',
                        ease: 'none',
                        delay: 3.8,
                    });
                }

                if (bioLine2) {
                    gsap.set(bioLine2, { text: '' });
                    gsap.to(bioLine2, {
                        duration: 3,
                        text: 'Building scalable web applications and AI-powered experiences.',
                        ease: 'none',
                        delay: 8,
                    });
                }
            }
        }

        // Cleanup function
        return () => {
            ScrollTrigger.getAll().forEach(trigger => trigger.kill());
        };
    }, []);

    return (
        
        <div ref={containerRef} style={styles.container}>
            <style>
                {`
          @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
          }
          
          .section {
            animation: fadeIn 0.8s ease-out;
          }
          
          .skill-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
          }
          
          .project-card:hover {
            transform: scale(1.03);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
          }
          
          .contact-link:hover {
            color: #000;
            text-decoration: underline;
          }

          /* Avatar hover effect */
          .avatar {
            transition: all 0.35s ease;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
          }

          .avatar:hover {
            transform: scale(1.08);
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.25);
          }

          /* Animation test styles */
          #animation-test {
            padding: 60px 20px;
            background-color: #ffffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 200px;
          }

          #animation-test .text-xl {
            font-size: 1.5rem;
            color: currentColor;
            letter-spacing: 0.06em;
            font-weight: 700;
          }
        `}
            </style>

            {/* Animation Test Section */}
            <div id="animation-test" className="large grid centered square-grid">
                <h2 className="text-xl">HELLO WORLD</h2>
            </div>

            {/* Hero Section */}
            <section style={styles.hero} className="section">
                <div style={styles.avatarContainer}>
                    <div className="avatar" style={styles.avatar}>
                        <span style={styles.avatarText}>ML</span>
                    </div>
                </div>
                <h1 ref={nameRef} style={styles.name}></h1>
                <p ref={titleRef} style={styles.title}></p>
                <p ref={bioRef} style={styles.bio}>
                    <span className="bio-line-1"></span>
                    <br />
                    <span className="bio-line-2"></span>
                </p>
            </section>

            {/* About Me Section */}
            <section style={styles.section} className="section">
                <h2 style={styles.sectionTitle}>About Me</h2>
                <div style={styles.sectionContent}>
                    <p style={styles.paragraph}>
                        Hi, I'm Minh — a Computer Science student at Phenikaa University with a passion for technology and innovation.
                        I specialize in full-stack development, focusing on creating efficient, user-friendly applications.
                    </p>
                    <p style={styles.paragraph}>
                        My expertise spans from front-end frameworks like React to back-end systems with Node.js, along with blockchain
                        development and AI/ML models. I'm always eager to learn and take on new challenges.
                    </p>
                </div>
            </section>

            {/* Skills Section */}
            <section style={styles.section} className="section">
                <h2 style={styles.sectionTitle}>Skills</h2>
                <div style={styles.skillsGrid}>
                    {[
                        'React', 'Node.js', 'TypeScript', 'Python',
                        'PostgreSQL', 'MongoDB', 'Docker', 'Git',
                        'REST APIs', 'GraphQL', 'TailwindCSS', 'AWS'
                    ].map((skill, index) => (
                        <div key={index} style={styles.skillCard} className="skill-card">
                            <span style={styles.skillText}>{skill}</span>
                        </div>
                    ))}
                </div>
            </section>

            {/* Projects Section */}
            <section style={styles.section} className="section">
                <h2 style={styles.sectionTitle}>Projects</h2>
                <div style={styles.projectsGrid}>
                    {[
                        {
                            title: 'E-Commerce Platform',
                            description: 'Full-featured shoe store with product management, cart system, and payment integration.',
                            tech: 'React, Node.js, PostgreSQL'
                        },
                        {
                            title: 'Blockchain DApp',
                            description: 'Decentralized application for secure medical records using Stellar Soroban smart contracts.',
                            tech: 'Rust, Stellar SDK, React'
                        },
                        {
                            title: 'AI Emotion Detector',
                            description: 'Machine learning model for real-time emotion recognition from facial expressions.',
                            tech: 'Python, YOLOv8, OpenCV'
                        }
                    ].map((project, index) => (
                        <div key={index} style={styles.projectCard} className="project-card">
                            <h3 style={styles.projectTitle}>{project.title}</h3>
                            <p style={styles.projectDescription}>{project.description}</p>
                            <p style={styles.projectTech}>{project.tech}</p>
                        </div>
                    ))}
                </div>
            </section>

            {/* Contact Section */}
            <section style={styles.section} className="section">
                <h2 style={styles.sectionTitle}>Contact</h2>
                <p style={styles.contactText}>
                    Let's connect and create something amazing together.
                </p>
                <div style={styles.contactLinks}>
                    <a href="mailto:minhle" style={styles.contactLink} className="contact-link">
                        Email
                    </a>
                    <span style={styles.separator}>•</span>
                    <a href="https://github.com/minhleeee123" target="_blank" rel="noopener noreferrer" style={styles.contactLink} className="contact-link">
                        GitHub
                    </a>
                    <span style={styles.separator}>•</span>
                    <a href="https://www.facebook.com/minh.le.187327" target="_blank" rel="noopener noreferrer" style={styles.contactLink} className="contact-link">
                        facebook
                    </a>
                </div>
            </section>
        </div>

    );
}

const styles = {
    container: {
        fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif',
        backgroundColor: '#ffffff',
        color: '#000000',
        minHeight: '100vh',
        padding: '0',
        margin: '0',
    },
    hero: {
        textAlign: 'center' as const,
        padding: '80px 20px',
        backgroundColor: '#ffffff',
        color: '#000000',
    },

    avatarContainer: {
        display: 'flex',
        justifyContent: 'center',
        marginBottom: '30px',
    },

    avatar: {
        width: '150px',
        height: '150px',
        borderRadius: '50%',
        backgroundColor: '#ffffff',      // màu nền trắng
        color: '#000000',                // chữ đen
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        fontSize: '48px',
        fontWeight: 'bold' as const,
        border: '3px solid #000000',     // viền đen
        boxShadow: '0 6px 20px rgba(0, 0, 0, 0.15)', // bóng đen mờ nhẹ
        transition: 'all 0.35s ease',
        cursor: 'pointer',
        userSelect: 'none' as const,
    },

    avatarText: {
        userSelect: 'none' as const,
    },

    name: {
        fontSize: '48px',
        fontWeight: '700' as const,
        margin: '20px 0 10px 0',
        letterSpacing: '-1px',
    },
    title: {
        fontSize: '20px',
        fontWeight: '300' as const,
        margin: '10px 0 20px 0',
        opacity: 0.9,
    },
    bio: {
        fontSize: '16px',
        lineHeight: '1.6',
        maxWidth: '600px',
        margin: '0 auto',
        opacity: 0.8,
    },
    section: {
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '80px 20px',
    },
    sectionTitle: {
        fontSize: '36px',
        fontWeight: '700' as const,
        textAlign: 'center' as const,
        marginBottom: '50px',
        letterSpacing: '-0.5px',
    },
    sectionContent: {
        maxWidth: '800px',
        margin: '0 auto',
    },
    paragraph: {
        fontSize: '18px',
        lineHeight: '1.8',
        marginBottom: '20px',
        color: '#333333',
    },
    skillsGrid: {
        display: 'grid',
        gridTemplateColumns: 'repeat(auto-fit, minmax(150px, 1fr))',
        gap: '20px',
        maxWidth: '900px',
        margin: '0 auto',
    },
    skillCard: {
        backgroundColor: '#f5f5f5',
        padding: '25px',
        textAlign: 'center' as const,
        borderRadius: '8px',
        border: '2px solid #e0e0e0',
        transition: 'all 0.3s ease',
        cursor: 'default',
    },
    skillText: {
        fontSize: '16px',
        fontWeight: '600' as const,
        color: '#000000',
    },
    projectsGrid: {
        display: 'grid',
        gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))',
        gap: '30px',
        maxWidth: '1100px',
        margin: '0 auto',
    },
    projectCard: {
        backgroundColor: '#ffffff',        // nền trắng
        color: '#000000',                   // chữ đen
        padding: '35px',
        borderRadius: '12px',
        border: '2px solid #000000',        // viền đen bao quanh
        transition: 'all 0.3s ease',
        cursor: 'pointer',
    },

    projectTitle: {
        fontSize: '22px',
        fontWeight: '700' as const,
        marginBottom: '15px',
    },
    projectDescription: {
        fontSize: '15px',
        lineHeight: '1.6',
        marginBottom: '20px',
        opacity: 0.9,
    },
    projectTech: {
        fontSize: '13px',
        fontWeight: '600' as const,
        opacity: 0.7,
        textTransform: 'uppercase' as const,
        letterSpacing: '0.5px',
    },
    contactText: {
        fontSize: '18px',
        textAlign: 'center' as const,
        marginBottom: '30px',
        color: '#333333',
    },
    contactLinks: {
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        gap: '20px',
        flexWrap: 'wrap' as const,
    },
    contactLink: {
        fontSize: '18px',
        fontWeight: '600' as const,
        color: '#666666',
        textDecoration: 'none',
        transition: 'all 0.3s ease',
    },
    separator: {
        color: '#cccccc',
        fontSize: '18px',
    },
};

export const layout = {
    areaId: 'content',
    sortOrder: 30
};
