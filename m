Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA21766
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Aug 2000 19:24:16 -0600
Date: Sat, 12 Aug 2000 20:22:17 +0100 (BST)
From: Dave Gilbert <gilbertd@treblig.org>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Just felt like sharing...  (no pun intended)
In-Reply-To: <878zu2mh0y.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.10.10008122018090.764-100000@tardis.home.dave>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 12 Aug 2000, David Huggins-Daines wrote:

> # ./ld.so hello-shared
> Hello shared library world!
> The answer is 42, or maybe 42

Good work!
 
> There's still a lot of work to be done, of course - glibc doesn't
> completely build with --enable-shared yet, and libdl.so is going to be
> somewhat more challenging (luckily the IA-64 people have already
> encountered some of the same issues).  Also note the kludgy way we
> have to explicitly link libgcc.a, which was mentioned in a previous
> thread.

Also Linux/Alpha probably has most of the same issues solved for a long
time.

> I just thought this was pretty cool :-)

Indeed.

Dave

-- 
 ---------------- Have a happy GNU millennium! ----------------------   
/ Dr. David Alan Gilbert      | Running GNU/Linux on       |  Happy  \ 
\   gro.gilbert @ treblig.org |  Alpha, x86, ARM and SPARC |  In Hex /
 ____________________________|___ http://www.treblig.org  |________/
