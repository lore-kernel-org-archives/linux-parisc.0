From: "Michael S. Zick" <mszick@goquest.com>
Subject: Re: [parisc-linux] Support for 2.4.x kernels on hppa
Date: Tue, 25 May 2004 12:12:03 -0500
Message-ID: <200405251212.03591.mszick@goquest.com>
References: <20040524183227.GW7207@tausq.org>
	<20040525122124.7154e4d2.gmsoft@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040525122124.7154e4d2.gmsoft@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue May 25 2004 05:21, Guy Martin wrote:
> On Mon, 24 May 2004 11:32:27 -0700
> > please speak up now!
>
> Personaly, I don't care about 2.4 even if 2.6 doesn't have SMP. With a
> 2.4, my D270 compiles things slower with SMP than without.=20

Hmm... Probably related to the slow fork/exec on hppa and the effect
of SMP load balancing in kernel scheduler -
There has been continuous work to improve fork/exec - I don't know if
the changes have been applied to 2.4.x systems - others on this list
will know.

> I also have=20
> other problems with SMP like packet loss to localhost, making portmap
> and other socket dae=F9on unusable.
2.4?? or 2.6??  (2.6.x has i/o scheduling)

Mike
>
>
> hth
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
