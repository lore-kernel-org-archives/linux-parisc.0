From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] "Unknown machine at ..." on N4k
Date: Thu, 22 Jul 2004 17:34:29 -0600
Message-ID: <20040722233429.GA27361@colo.lackof.org>
References: <20040720182500.GA11659@colo.lackof.org>
	<40FB896400001774@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: List Parisc <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40FB896400001774@ocpmta2.freegates.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jul 22, 2004 at 08:05:32AM +0200, Joel Soete wrote:
> umm I was curious to know why the code find sversion=0x0 while
> hp_hardware_list awaiting 0x4 (as for all other CPUs)?
> (a firmware pb, another pdc location or awaited 0x4 is wrong in my case
> (I can only test one N) and another entry should be added with sversion=0x0?)

I suggest just adding another entry to hp_hardware_list[].
It's either a bug in either the PDC implementation or the IO ACD
(Arch Control Doc) we took the initial table from. I'm much more
inclined to believe we transposed/updated the table incorrectly.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
