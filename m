From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Bug report: 2.6.15 crash when accessing nbd on a
	712.
Date: Thu, 9 Mar 2006 10:47:50 -0500
Message-ID: <20060309154750.GA11249@quicksilver.road.mcmartin.ca>
References: <440CB949.7040706@free.fr>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: vincent.stehle@free.fr
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <440CB949.7040706@free.fr>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Mar 06, 2006 at 11:35:53PM +0100, Vincent Stehl? wrote:
> I tried to have nbd in module or not, but this does not change anything.
>

Grant and I fixed this a couple weeks ago:
http://cvs.parisc-linux.org/linux-2.6/arch/parisc/mm/init.c?r1=1.22&r2=1.23

Please try a newer kernel, such as this one:
http://cvs.parisc-linux.org/download/linux-2.6/autobuild/712_defconfig/palinux-712-defconfig-2.6.15-pa4_0-2_all.deb

Cheers,
	Kyle 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
