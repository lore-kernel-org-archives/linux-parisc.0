From: rray@tcmail.mstc.state.ms.us
Subject: Re: [parisc-linux] Console problem
Date: Wed, 1 Dec 2004 08:41:43 -0600 (CST)
Message-ID: <Pine.LNX.4.58.0412010835070.10014@rray.drdc.mstc.ms.gov>
References: <Pine.LNX.4.58.0411301543230.17128@rray.drdc.mstc.ms.gov>
	<41AD7F64.2040404@lycos.nl>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=X-UNKNOWN
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41AD7F64.2040404@lycos.nl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Maybe the problem is simple. I hope the solution is.
I used palinux-2.4.21-pa6-20030718-netinst.iso to install.
It uses 2.4.21-32 kernel which I assume has PDC support.
After the base install the kernel I have is 2.4.17-32 which I assume has
no PDC support.
Is there an easy fix for this?

Thanks
Richard Ray

On Wed, 1 Dec 2004, Corn=E9 Beerse wrote:

> rray@tcmail.mstc.state.ms.us wrote:
> > Hey all,
> >
> > I've just installed Debian on a 9000/819 K200.
> > The base install went fine after I changed the console to ttyB0.
> > After the reboot I get the dredded "If this is the last
> > message you see, you may need to switch your console.  This is
> > a common symptom -- search the FAQ and mailing list at parisc-linux.org=
".
> > And this is the last thing I see.
> > I've seen references in the mailing list about switching consoles but n=
ot
> > what this really means.
> > I only have one console connected with a serial cable to the console po=
rt
> > of the server.
> > Could someone give me a little more info.
>
> This all depends on the base system (your K200 here) and sometimes additi=
onal
> hardware.
>
> I don't know details on your K200 but for example my (now gone) D210 was =
verry
> basic: just a processor, memory, disk and tape. No additional terminal ca=
rds or
> such. This box just continued after a relative long time with the kernel =
loading
> messages. Your tip: patience...
>
> My (still pressent) D370 has an additional service card with an UPS conne=
ctor
> and a phone-connector. With this system, I had to plug the console from t=
he
> first to the second serial connector. After removing the board, the conso=
le
> stays on the first serial connector. Your tip: remove not necessary board=
s from
> the system, just to get it going.
>
> I recall from messages on this list that machines with serial consoles on
> expansion boards (boards with multiple serial connectors) do have problem=
s with
> their console since the boards are not that well (read not at all) suppor=
ted due
> to lack of documentation.
>
> Hence, check the documentation on all pages mentioned at the debian-porti=
ng
> page: http://www.debian.org/ports/hppa/
>
>
> CBee
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
