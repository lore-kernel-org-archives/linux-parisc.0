From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] "Unknown machine at ..." on N4k
Date: Wed, 14 Jul 2004 18:59:43 -0600
Message-ID: <20040715005943.GF2810@colo.lackof.org>
References: <40BD9F870001BC0C@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40BD9F870001BC0C@ocpmta2.freegates.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jul 14, 2004 at 05:24:23PM +0000, Joel Soete wrote:
...
> 19. Unknown machine at 0xfffffffffed25000 [37] { 0, 0x0, 0x5d3, 0x00000 }
...
> Any idea where I have to look for to change it?

It needs to be added to arch/parisc/kernel/hardware.c.
see hp_hardware_list[] declaration :^)

We just need to know what the proper name for the CPU is.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
