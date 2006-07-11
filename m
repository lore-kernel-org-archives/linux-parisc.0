From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] 2.6.18-rc1-pa1: new printk's warning?
Date: Tue, 11 Jul 2006 15:27:59 +0200
Message-ID: <J28QQN$2C78E6C4D1CF6CFF36C63BCCB1DABEF4@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "Parisc List" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello,

Because of this resource_size_t change in this new 2.6.18-rc1:
include/linux/types.h
#ifdef CONFIG_RESOURCES_64BIT
typedef u64 resource_size_t;
#else
typedef u32 resource_size_t;
#endif

and related resource structure:
include/linux/ioport.h
struct resource {
        resource_size_t start;
        resource_size_t end;
        const char *name;
        unsigned long flags;
        struct resource *parent, *sibling, *child;
};

(btw, as start and end are actualy addresses, I would find more relevant =
to
use resource_addr_t as new typedef ;-?)

some printk() warning appears:
# grep resource_size_t  /var/logs/k-2.6.18-rc1-pa1-c110-t
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/arch/parisc/kernel/drivers.c:837: wa=
rning:
format '%lx' expects type 'long unsigned int', but argument 4 has type
'resource_size_t'
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/drivers/net/lasi_82596.c:1545: warni=
ng:
format '%lx' expects type 'long unsigned int', but argument 3 has type
'resource_size_t'
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/drivers/net/lasi_82596.c:1550: warni=
ng:
format '%lx' expects type 'long unsigned int', but argument 2 has type
'resource_size_t'
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/drivers/parisc/ccio-dma.c:1402: warn=
ing:
format '%08lx' expects type 'long unsigned int', but argument 3 has type
'resource_size_t'
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/drivers/parisc/ccio-dma.c:1402: warn=
ing:
format '%08lx' expects type 'long unsigned int', but argument 4 has type
'resource_size_t'
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/drivers/parisc/ccio-dma.c:1554: warn=
ing:
format '%lx' expects type 'long unsigned int', but argument 3 has type
'resource_size_t'
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/drivers/parisc/asp.c:85: warning: fo=
rmat
'%lx' expects type 'long unsigned int', but argument 4 has type 'resource=
_size_t'
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/drivers/parisc/eisa.c:318: warning: =
format
'%08lx' expects type 'long unsigned int', but argument 3 has type
'resource_size_t'
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/drivers/parisc/eisa_enumerator.c:101=
:
warning: format '%lx' expects type 'long unsigned int', but argument 2 ha=
s
type 'resource_size_t'
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/drivers/parisc/eisa_enumerator.c:101=
:
warning: format '%lx' expects type 'long unsigned int', but argument 3 ha=
s
type 'resource_size_t'
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/drivers/parisc/eisa_enumerator.c:191=
:
warning: format '%lx' expects type 'long unsigned int', but argument 2 ha=
s
type 'resource_size_t'
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/drivers/parisc/eisa_enumerator.c:191=
:
warning: format '%lx' expects type 'long unsigned int', but argument 3 ha=
s
type 'resource_size_t'
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/drivers/parport/parport_gsc.c:363:
warning: format '%lx' expects type 'long unsigned int', but argument 2 ha=
s
type 'resource_size_t'
/Debian-apt/SRC/linux-2.6.18-rc1-pa1/drivers/serial/8250_gsc.c:45: warnin=
g:
format '%lx' expects type 'long unsigned int', but argument 2 has type
'resource_size_t'

Any idea?

Thanks,
    Joel=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous de=
venez aujourd'hui Scarlet One grace a un client existant de Scarlet, vous=
 recevez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite su=
r http://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
