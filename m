From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ext2 vs ext3 on hppa
Date: Sat, 12 Feb 2005 20:11:57 +0000
Message-ID: <420E630D.8030504@tiscali.be>
References: <20050211071629.GA32318@colo.lackof.org>	<420CAE3C.7090004@lycos.nl>
	<20050211174752.GC8835@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050211174752.GC8835@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

[...]
> 
> My bad. I was running two instances of "make" in the same source tree.
> I had forgotten about the "while :" loop that was doing builds.
> /me hides
> 
mmm when I did (sorry not any more able to do it :_( ) similar test it seems that segfault to only occured with option -j2 (or 
greater) and only on smp system (on such b2k the same test _never_ segfault also on ext3)

hth,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
