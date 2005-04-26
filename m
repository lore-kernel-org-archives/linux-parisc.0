From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] head.S: a small typo
Date: Tue, 26 Apr 2005 15:43:29 -0400
Message-ID: <20050426194329.GA19796@roadwarrior.mcmartin.ca>
References: <200504251623.j3PGNq6m011656@hiauly1.hia.nrc.ca>
	<4252B02B000092E3@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4252B02B000092E3@mail-1-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Apr 26, 2005 at 07:36:43PM +0200, Joel Soete wrote:
> (btw I disasemble the resulting kernel text and this code seems to be only
> called once and very early)
> 

This is the kernel entry point from the bootloader. It sets things up then 
jumps to init/main.c:start_kernel().

-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
