From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Mon, 24 Jul 2006 00:26:21 -0400
Message-ID: <7d01f9f00607232126o68124272he34464cf9abeab4e@mail.gmail.com>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
	<1153708426.1235.11.camel@mulgrave.il.steeleye.com>
	<7d01f9f00607231954m7b9992e8r6148bb26b7b461da@mail.gmail.com>
	<1153711459.1235.13.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "James Bottomley" <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1153711459.1235.13.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 7/23/06, James Bottomley <James.Bottomley@steeleye.com> wrote:
> On Sun, 2006-07-23 at 22:54 -0400, Thibaut VARENE wrote:
> > Actually on some occasion, the sshd would kill the incoming connection
> > with "bad packet length" and "invalid hash packet" and all sorts of
> > various nasty error messages. And we made sure that these messages
> > were sent by the _server_, not the _client_...
> >
> > My take is that we see that bug so much more on pa8800 because of its
> > huge cache and thus because we hit cache much more often than on all
> > other machines...
> >
> > Still investigating this, i'm about to bring back online my rp3440 ;)
>
> I can get a stable ssh connection to a pa8800 ... once established, I
> don't ever see them close for MIC problems.

I'm totally amazed. Carlos and I could never get a single established
connection...

> To get one going, you just start several remote ssh's at once, so this
> would tend to indicate that it's some type of timing issue connected to
> the fork.

Well, I can consistently crash a remote telnet session if i output too
much data in the terminal (eg running dmesg or ls -lR). I doubt this
is fork related...

Another point worth mentioning, is that sshd is very likely mlocking
stuff so that it doesn't get swapped. Actually, it's been a while
since i last gave a look at sshd source, but I'd bet it keeps mostly
everything in RAM, and given the size of the cache on pa8800, blah
blah see my other mail i'm exhausted ;)

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
