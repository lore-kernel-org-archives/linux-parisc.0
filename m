From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Module Relocation Problem
Date: Sun, 25 Jun 2006 22:10:22 -0400
Message-ID: <20060626021022.GA19541@tachyon.int.mcmartin.ca>
References: <J0FGHF$3C34E7AFFFACE857F314B50EFB7BB29D@scarlet.be>
	<200606101105.38472.kmh@sonic.net> <448B184F.7020309@tiscali.be>
	<200606251902.11694.kmh@sonic.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Kai Holthaus <kmh@sonic.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606251902.11694.kmh@sonic.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 25, 2006 at 07:02:04PM -0700, Kai Holthaus wrote:
> This has all been very helpful. If it is indeed a problem in the hppa-linux 
> kernel, I'll keep a watchful eye out for fixes. If there's anything a kernel 
> layman like me can do, please let me know.
> 

Ironic that you mentioned this today. The fix to module.c James
committed yesterday should fix this for you. Please try 2.6.17-pa6 and
see if that helps.

Cheers,
	Kyle M.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
