From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] No 2.6 kernel on 735/125 with CRX24?
Date: Mon, 27 Sep 2004 17:13:00 +0000
Message-ID: <4152E81E00000BF8@mail-8-bnl.mail.tiscali.sys>
References: <200409271828.31259.j.raspe@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@parisc-linux.org
To: j.raspe@t-online.de
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409271828.31259.j.raspe@t-online.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Johannes,
> >
[...]
> I tried:
> palinux-712-defconfig-2.6.8.1-pa11
> palinux-b180-defconfig-2.6.8.1-pa11
> palinux-32-2.6.6-pa4
> palinux-712-defconfig-2.6.6-pa4
> palinux-b180-defconfig-2.6.6-pa4
> 
> all with the same result as before.
> 
> After that I compiled a 2.6.9-rc2-pa7 kernel without support for frameb=
uffer
> 
> (CONFIG_FB) which booted perfectly with serial console.
Cool :)

> So I think we can track down the problem to the framebuffer driver in
the
> 
> kernels > 2.6 with my graphics device, which should be supported accord=
ing
> to 
> the beginning of stifb.c.

I trust that it's a known issue: read the thread on debian-hppa <http://l=
ists.debian.org/debian-hppa/2004/09/msg00000.html>


> I attached both, the 2.4 and the 2.6 dmesg.
> 
Thanks

> What could I try next ??
> 
It seems that severall are already working on this pb :).

Regards,
    Joel

-------------------------------------------------------------------------=
--
Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-en..=
.
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
