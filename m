Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (unknown [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B109E482C
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Jun 2003 11:21:35 -0600 (MDT)
Date: Tue, 3 Jun 2003 19:21:32 +0200
Message-ID: <3ED70CF1000016E7@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] compiler & kernel
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Max,

>
>Attachment: config-2.4.20-pa35-gcc-3.3
>
32-bits first;
I test this config with gcc-3.3-2 and binutils 2.13.90.0.18-7 but I encounter
following pb:

`gcc-3.3 -print-libgcc-file-name` /usr/src/linux-2.4.20-pa35/arch/parisc/lib/lib.a

/usr/src/linux-2.4.20-pa35/lib/lib.a  \
        --end-group \
        -o vmlinux
drivers/net/wireless/wireless_net.o(.init.text+0x78): In function `init_orinoco_cs':
: undefined reference to `CardServices'
drivers/net/wireless/wireless_net.o(.ini
.text+0xac): In function `init_orinoco_cs':
: undefined reference to `register_pccard_driver'
drivers/net/wireless/wireless_net.o(.exit.text+0x2c): In function `exit_orinoco_cs':
: undefined reference to `unregister_pccard_driver'
drivers/net/wirel
ss/wireless_net.o(.text.cs_error+0x18): In function `cs_error':
: undefined reference to `CardServices'
drivers/net/wireless/wireless_net.o(.text.orinoco_cs_cor_reset+0x48): In
function `orinoco_cs_cor_reset':
: undefined reference to `CardServices

drivers/net/wireless/wireless_net.o(.text.orinoco_cs_cor_reset+0x74): In
function `orinoco_cs_cor_reset':
: undefined reference to `CardServices'
drivers/net/wireless/wireless_net.o(.text.orinoco_cs_cor_reset+0xd4): In
function `orinoco_cs_cor_re
et':
: undefined reference to `CardServices'
drivers/net/wireless/wireless_net.o(.text.orinoco_cs_attach+0x108): In function
`orinoco_cs_attach':
: undefined reference to `CardServices'
drivers/net/wireless/wireless_net.o(.text.orinoco_cs_detach+0
90): more
undefined references to `CardServices' follow
make: *** [vmlinux] Error 1

And the very same with gcc-3.0.4-16 {(which also backport canonicalize_*
?)}

Any idea?

Now overall results:
[the two test made exactely the same number of 
cc (grep "^gcc" blabla |
wc -l == 968)]

gcc-3.3

start: k-2.4.20-pa35-cfg-gcc33:Tue Jun  3 18:22:57 CEST 2003
end:   k-2.4.20-pa35-cfg-gcc33:Tue Jun  3 18:41:31 CEST 2003
(About 19 min)

gcc-3.0
start: k-2.4.20-pa35-cfg-gcc30:Tue Jun  3 19:1
:44 CEST 2003
end:   k-2.4.20-pa35-cfg-gcc30:Tue Jun  3 19:30:46 CEST 2003
(about 17 min)

I am not enough happy because not yet reach to obtain a kernel; I will try
tomorrow :(

Cheers,
    Joel

PS: I run those draft test on a b2k running a
kernel compile with gcc-3.3
(32-bits) and the BogoMIPS in dmesg is 799.53 (about 2 * 400MHz of cpu).
On the other hand I will made same test on a N (ucp) running a 64-bit kernel
with BogoMIPS announced as 1097.72 (about 2 * 550 Mhz of cpu).

Well 
hat is only draft info, I am waiting to run your kernel on the two
machime to see?


>
>Attachment: config-2.4.20-pa35-64
>

(I hope tomorrow )




---------------------------------
Découvrez les 6 clés et gagnez le Club Med à Vie avec Tiscali
http://www.tiscali.be/nl/subs/tiscali4life/default.asp?lang=fr
