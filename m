From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] 2.6.10-rc1-pa11 profile data
Date: Thu, 11 Nov 2004 00:54:31 -0700
Message-ID: <20041111075431.GB9768@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I was comparing "time" output for various flavors of
kernels and arches. We are something like 11m/17m/5m
for real/user/sys on a dual j6700 (dual 750Mhz, running
2.6.10-rc1-pa11-32SMP kernel building a 64-bit kernel
(using gcc 3.0.4). Similar numbers for J6000 (dual 550Mhz)
doing a 32-bit kernel build (gcc 3.3.x): 14m/22m/5m.

While this might look very favorable to a similar full kernel
build on a 1.5Ghz RX2600 which takes about as long (11m/20m/1m), 
the ia64 machine spends less than 1m in the kernel.

I've collect two profiles for -64SMP and will collect
some UP profiles tomorrow. profiles so far are measuring
a full kernel build. I expect I'll do the same for -64UP
kernels too.

What I have so far is on:
	http://www.parisc-linux.org/~grundler/prof-j6700/

d- and i-cache flushing routines are still the top consumers.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
