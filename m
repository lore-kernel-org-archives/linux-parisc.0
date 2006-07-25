From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Tue, 25 Jul 2006 12:37:04 -0400
Message-ID: <7d01f9f00607250937i76ceaa01r4751d9ed9f02acd5@mail.gmail.com>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
	<1153708426.1235.11.camel@mulgrave.il.steeleye.com>
	<7d01f9f00607231954m7b9992e8r6148bb26b7b461da@mail.gmail.com>
	<20060724033223.GE29603@parisc-linux.org>
	<7d01f9f00607232115n18865924s4f07f64d84e45dce@mail.gmail.com>
	<1153750204.1235.18.camel@mulgrave.il.steeleye.com>
	<20060724163228.GA22560@colo.lackof.org>
	<1153839113.3452.28.camel@mulgrave.il.steeleye.com>
	<7d01f9f00607250934o111be951sc4ba0b765ed986ba@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "James Bottomley" <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00607250934o111be951sc4ba0b765ed986ba@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 7/25/06, Thibaut VARENE <T-Bone@parisc-linux.org> wrote:
> On 7/25/06, James Bottomley <James.Bottomley@steeleye.com> wrote:
>
> > This theory seems to explain all of the behaviour, why we see it so
> > rarely, and why it seems to happen around forks when I/O is going on in
> > the system.  Unfortunately it also seems to indicate that the only way
> > of fixing it would be to have full equivalence.
>
> So basically what you explain here should only affect pa8800, and what
> we see on other machines is something else, correct?

And another quick dump: "rarely" only if we have one socket enabled in
the system. Try to enable both sockets, the system won't even boot...
Might be something else again, though.
Yet, that's probably a clue.

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
