From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Kernel 2.6.8 compile bomb...
Date: Thu, 2 Dec 2004 09:42:52 -0700
Message-ID: <20041202164252.GA15041@colo.lackof.org>
References: <Pine.LNX.4.58.0412020842550.10014@rray.drdc.mstc.ms.gov>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: rray@tcmail.mstc.state.ms.us
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0412020842550.10014@rray.drdc.mstc.ms.gov>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Dec 02, 2004 at 08:48:47AM -0600, rray@tcmail.mstc.state.ms.us wrote:
> I'm getting the same results with 2.6.9 I got from kernel.org.

kernel.org is missing patches that parisc needs.
See http://cvs.parisc-linux.org/download/linux-2.6/

> I left all of the "stock" setting. SOM support is off.
> I just intalled Debian on a K200 yesterday. Everythings working except
> peripherals.

For a newer kernel, the above URL provides a debian depot that
one can install *experimental* kernels from.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
