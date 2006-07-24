From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Mon, 24 Jul 2006 00:31:36 -0400
Message-ID: <7d01f9f00607232131m704f1918q6671fe0077e9d16b@mail.gmail.com>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
	<1153708426.1235.11.camel@mulgrave.il.steeleye.com>
	<7d01f9f00607231954m7b9992e8r6148bb26b7b461da@mail.gmail.com>
	<1153711459.1235.13.camel@mulgrave.il.steeleye.com>
	<7d01f9f00607232126o68124272he34464cf9abeab4e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "James Bottomley" <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00607232126o68124272he34464cf9abeab4e@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 7/24/06, Thibaut VARENE <T-Bone@parisc-linux.org> wrote:
> On 7/23/06, James Bottomley <James.Bottomley@steeleye.com> wrote:
> > On Sun, 2006-07-23 at 22:54 -0400, Thibaut VARENE wrote:
> > > Actually on some occasion, the sshd would kill the incoming connection
> > > with "bad packet length" and "invalid hash packet" and all sorts of
> > > various nasty error messages. And we made sure that these messages
> > > were sent by the _server_, not the _client_...
> > >
> > > My take is that we see that bug so much more on pa8800 because of its
> > > huge cache and thus because we hit cache much more often than on all
> > > other machines...
> > >
> > > Still investigating this, i'm about to bring back online my rp3440 ;)
> >
> > I can get a stable ssh connection to a pa8800 ... once established, I
> > don't ever see them close for MIC problems.
>
> I'm totally amazed. Carlos and I could never get a single established
> connection...

Another quick dump, yesterday, Carlos and I experienced a totally
different behaviour from our statically linked sshd. It wouldn't even
start... Grant on the other hand, first kept being bounced off ioz and
suddenly started to consistently get passwd prompts, but couldn't
login... Dunno if that rings any bells.

Carlos will probably have more to say about what we've been through
yesterday, he took notes ;)

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
