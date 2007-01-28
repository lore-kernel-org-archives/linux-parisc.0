From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] binutils-2.17.50.0.10+ hates hppa ?
Date: Sun, 28 Jan 2007 00:29:54 -0500
Message-ID: <5b2e36650701272129o523e60ees2f3910bd93e0d3b0__32676.523741293$1416624271$gmane$org@mail.gmail.com>
References: <200701271448.05974.vapier@gentoo.org>
	<200701272013.l0RKDq7Q012171@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============2060064217=="
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701272013.l0RKDq7Q012171@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============2060064217==
Content-Type: multipart/alternative;
	boundary="----=_Part_22508_20880163.1169962194970"

------=_Part_22508_20880163.1169962194970
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 27/01/07, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
>
> > > huh ?  that patch was against vanilla binutils release ... in other
> words,
> > > i did `tar jxf binutils-2.17.50.0.11.tar.bz2` ... so unless Gentoo has
> > > patched tar to screw up elf32-hppa.c, i dont think it's a Gentoo issue
> >
> > looking through some binutils history, this looks like some fix that
> HJLu h=
> > as=20
> > done (Jan 2007 / PR3826) ... i'll complain to him/binutils list that
> he's
> > fuckin up my mojo :)
>
> Just blame HJL.  Personally, I don't see much merit in using
> "linux binutils" on hppa.


Except that this is what a number of distros  (Gentoo, Fedora, Ubuntu) are
shipping at the moment.

Tks,
Jeff Bailey

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/

------=_Part_22508_20880163.1169962194970
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 27/01/07, <b class="gmail_sendername">John David Anglin</b> &lt;<a href="mailto:dave@hiauly1.hia.nrc.ca">dave@hiauly1.hia.nrc.ca</a>&gt; wrote:<div><span class="gmail_quote"></span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
&gt; &gt; huh ?&nbsp;&nbsp;that patch was against vanilla binutils release ... in other words,<br>&gt; &gt; i did `tar jxf binutils-2.17.50.0.11.tar.bz2` ... so unless Gentoo has<br>&gt; &gt; patched tar to screw up elf32-hppa.c, i dont think it&#39;s a Gentoo issue
<br>&gt;<br>&gt; looking through some binutils history, this looks like some fix that HJLu h=<br>&gt; as=20<br>&gt; done (Jan 2007 / PR3826) ... i&#39;ll complain to him/binutils list that he&#39;s<br>&gt; fuckin up my mojo :)
<br><br>Just blame HJL.&nbsp;&nbsp;Personally, I don&#39;t see much merit in using<br>&quot;linux binutils&quot; on hppa.</blockquote><div><br>Except that this is what a number of distros&nbsp; (Gentoo, Fedora, Ubuntu) are shipping at the moment.
<br></div><br></div>Tks,<br>Jeff Bailey<br clear="all"><br>-- <br>Jeff Bailey - <a href="http://www.raspberryginger.com/jbailey/">http://www.raspberryginger.com/jbailey/</a>

------=_Part_22508_20880163.1169962194970--

--===============2060064217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============2060064217==--
