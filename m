From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Tue, 17 Oct 2006 15:07:36 -0400
Message-ID: <20061017190736.GA4997@tachyon.int.mcmartin.ca>
References: <J7AHPO$ED967CCDD9E203D6968EA2045C11A08A@scarlet.be>
	<45351637.4070604@computer.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Andrew Gaylard <ag@computer.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45351637.4070604@computer.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Oct 17, 2006 at 07:43:19PM +0200, Andrew Gaylard wrote:
>    Why do we truncate the memory like this?
>    My 4GB box is now "missing" 512M.
> 

the top 1/16 of physical memory is F-space for PDC and IO. there
are other reservations too.

it seems fairly logical that you can't fit 4GB of memory and anything
else in a 32bit number.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
