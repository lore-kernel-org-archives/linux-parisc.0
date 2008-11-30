From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Sun, 30 Nov 2008 15:24:42 -0500 (EST)
Message-ID: <20081130202443.7B1154FB4@hiauly1.hia.nrc.ca>
References: <20081126185143.065841db@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, grundler@parisc-linux.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: gmsoft@tuxicoman.be (Guy Martin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081126185143.065841db@tuxicoman.be> from "Guy Martin" at Nov 26, 2008 06:51:43 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

I just pulled and built Kyle's parisc-2.6 tree.  It essentially 2.6.28-rc6
plus four extra patches (three parisc specific).

I am seeing these warnings in a 64-bit kernel build:

drivers/input/keyboard/hilkbd.c: In function 'hil_init_chip':
drivers/input/keyboard/hilkbd.c:317: warning: format '%08lx' expects type 'long unsigned int', but argument 2 has type 'resource_size_t'

drivers/net/lasi_82596.c: In function 'lan_init_chip':
drivers/net/lasi_82596.c:164: warning: format '%lx' expects type 'long unsigned 
int', but argument 3 has type 'resource_size_t'
drivers/net/lasi_82596.c:169: warning: format '%lx' expects type 'long unsigned 
int', but argument 2 has type 'resource_size_t'

drivers/parisc/ccio-dma.c: In function 'ccio_init_resource':
drivers/parisc/ccio-dma.c:1403: warning: format '%08lx' expects type 'long unsig
ned int', but argument 3 has type 'resource_size_t'drivers/parisc/ccio-dma.c:1403: warning: format '%08lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'
drivers/parisc/ccio-dma.c: In function 'ccio_probe':
drivers/parisc/ccio-dma.c:1554: warning: format '%lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'

drivers/parisc/hppb.c: In function 'hppb_probe':
drivers/parisc/hppb.c:65: warning: format '%x' expects type 'unsigned int', but argument 2 has type 'resource_size_t'
drivers/parisc/hppb.c:77: warning: format '%08x' expects type 'unsigned int', but argument 3 has type 'resource_size_t'
drivers/parisc/hppb.c:77: warning: format '%08x' expects type 'unsigned int', but argument 4 has type 'resource_size_t'

drivers/parisc/dino.c:822: warning: format '%lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'
drivers/parisc/dino.c:822: warning: format '%lx' expects type 'long unsigned int', but argument 5 has type 'resource_size_t'
drivers/parisc/dino.c: In function 'dino_common_init':
drivers/parisc/dino.c:902: warning: format '%lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'
drivers/parisc/dino.c:902: warning: format '%lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'

drivers/parisc/asp.c: In function 'asp_init_chip':
drivers/parisc/asp.c:85: warning: format '%lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'

drivers/parport/parport_gsc.c: In function 'parport_init_chip':
drivers/parport/parport_gsc.c:356: warning: format '%lx' expects type 'long unsigned int', but argument 2 has type 'resource_size_t'

drivers/serial/8250_gsc.c: In function 'serial_init_chip':
drivers/serial/8250_gsc.c:44: warning: format '%lx' expects type 'long unsigned 
int', but argument 2 has type 'resource_size_t'

sound/parisc/harmony.c: In function 'snd_harmony_create':
sound/parisc/harmony.c:938: warning: format '%lx' expects type 'long unsigned in
t', but argument 2 has type 'resource_size_t'

'resource_size_t' is defined in linux/types.h:

#ifdef CONFIG_PHYS_ADDR_T_64BIT
typedef u64 phys_addr_t;
#else
typedef u32 phys_addr_t;
#endif

typedef phys_addr_t resource_size_t;

CONFIG_PHYS_ADDR_T_64BIT is defined in linux/autoconf.h, so I have to think
it is not being included, resulting in incorrect defines for phys_addr_t.
Is this what needs to be done?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
