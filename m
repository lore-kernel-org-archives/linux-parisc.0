From: Guy Martin <gmsoft@gentoo.org>
Subject: Re: [parisc-linux] glibc 2.5 & TLS linuxthreads (+ NPTL status)
Date: Mon, 5 Feb 2007 22:32:28 +0100
Message-ID: <20070205223228.0cfb75f8.gmsoft__34893.4687710882$1416624278$gmane$org@gentoo.org>
References: <45C7A0CF.4020404@aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: debian-glibc@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Aurelien Jarno <aurelien@aurel32.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45C7A0CF.4020404@aurel32.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 05 Feb 2007 22:25:35 +0100
Aurelien Jarno <aurelien@aurel32.net> wrote:

> Also what is the current status of NPTL on HPPA. Last time I tried it
> was building but they were some failures in the testsuite. I am
> currently building a test version here. Is it something stable enough
> that it can be used "in production"? I have seen Gentoo has made the
> switch...

Nope, not yet, our test with glibc-2.5 resulted in segfault with all threaded stuff.

I hope you'll have more success :)

> 
> Bye,
> Aurelien

-- 
Guy Martin
Gentoo Linux - HPPA port Lead

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
