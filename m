From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Sun, 23 Jul 2006 22:54:38 -0400
Message-ID: <7d01f9f00607231954m7b9992e8r6148bb26b7b461da@mail.gmail.com>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
	<1153708426.1235.11.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "James Bottomley" <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1153708426.1235.11.camel@mulgrave.il.steeleye.com>
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
> Carlos wrote:
> > Grant expressed worry that "Pattern 1" was indicative of a dma sync
> > problem with the network socket read.
>
> I'm still dubious about this one ... even if we agree it's a D cache
> issue, it's definitely a D cache issue affecting program execution (i.e.
> function pointers or call indirection).  The data coming out of the
> network pipe for ssh never finds its way into the execution stream,
> which means it's unlikely to affect these areas.  Additionally, ssh has
> message integrity checks which fail noisily (i.e. the network data is
> verified against a secure hash before it's used).  So, if we had
> incoherent data from the pipe, I would exect to see periodic MIC
> failures, which we don't see.

Actually on some occasion, the sshd would kill the incoming connection
with "bad packet length" and "invalid hash packet" and all sorts of
various nasty error messages. And we made sure that these messages
were sent by the _server_, not the _client_...

My take is that we see that bug so much more on pa8800 because of its
huge cache and thus because we hit cache much more often than on all
other machines...

Still investigating this, i'm about to bring back online my rp3440 ;)

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
