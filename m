From: ram <talk2ram@gmail.com>
Subject: Re: [parisc-linux] almost booted a K420...
Date: Thu, 12 Apr 2007 16:20:40 +0530
Message-ID: <b74751490704120350s162d6140g95622904d2142bca__34650.792546063$1416624330$gmane$org@mail.gmail.com>
References: <461DA527.8FF91FC1@bom.gov.au>
	<9df6f3ea0704112341y55866aebk73373b75e90686d1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1016092917=="
Cc: parisc-linux@lists.parisc-linux.org
To: "Andrew Gaylard" <ag@computer.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <9df6f3ea0704112341y55866aebk73373b75e90686d1@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1016092917==
Content-Type: multipart/alternative;
	boundary="----=_Part_30510_10967414.1176375040964"

------=_Part_30510_10967414.1176375040964
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> Hi Paul,
>
> I'm using a K370 with great success. I'm not sure whether
> the Debian install CD will work on a multi-CPU box.  You can
> try unplugging all but the first CPU and see if that makes a
> difference.  Also, you may have to add "console=ttyB0" or
> somesuch to PALO's boot line -- the K classes (and perhaps
> a few other boxes) have very different serial hardware.  Oh
> wait, I see you have it already.
>
> Sorry this  is a bit vague; I run Gentoo and it was very simple
> to boot the install CD.  So if you hit a dead-end, you might
> give it a try.


Hi

some time back i posted the problem, but  some one responded, but i did not
solve the problem

after i saw the new version released, i want to try, but i see the same
problem

 Kernel Panic- not syncing:drivers/parisc/ccio-dma.c: ccio_alloc_range() I/O
MMU is out of mapping resources

iam using  webconsole and installing

any suggestion make my system working with Debian 4.X

HP R Class 9000, 1GB RAM, Built in CD ROM

thanks
ram

------=_Part_30510_10967414.1176375040964
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br>
<div>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Hi Paul,<br><br>I&#39;m using a K370 with great success. I&#39;m not sure whether<br>the Debian install CD will work on a multi-CPU box.&nbsp; You can 
<br>try unplugging all but the first CPU and see if that makes a<br>difference.&nbsp; Also, you may have to add &quot;console=ttyB0&quot; or<br>somesuch to PALO&#39;s boot line -- the K classes (and perhaps<br>a few other boxes) have very different serial hardware.&nbsp; Oh 
<br>wait, I see you have it already.<br><br>Sorry this&nbsp; is a bit vague; I run Gentoo and it was very simple<br>to boot the install CD.&nbsp; So if you hit a dead-end, you might<br>give it a try.</blockquote>
<div>&nbsp;</div>
<div>Hi</div>
<div>&nbsp;</div>
<div>some time back i posted the problem, but&nbsp; some one responded, but i did not solve the problem</div>
<div>&nbsp;</div>
<div>after i saw the new version released, i want to try, but i see the same problem</div>
<div>&nbsp;</div>
<div>
<div>Kernel Panic- not syncing:drivers/parisc/ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping resources</div>&nbsp;</div>
<div>iam using&nbsp; webconsole and installing</div>
<div>&nbsp;</div>
<div>any suggestion make my system working with Debian 4.X</div>
<div>&nbsp;</div>
<div>HP R Class 9000, 1GB RAM, Built in CD ROM</div>
<div>&nbsp;</div>
<div>thanks</div>
<div>ram&nbsp;</div></div>

------=_Part_30510_10967414.1176375040964--

--===============1016092917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1016092917==--
