From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Module Relocation Problem
Date: Mon, 26 Jun 2006 08:10:56 -0400
Message-ID: <20060626121056.GA16242@athena.road.mcmartin.ca>
References: <J0FGHF$3C34E7AFFFACE857F314B50EFB7BB29D@scarlet.be>
	<200606251902.11694.kmh@sonic.net>
	<20060626021022.GA19541@tachyon.int.mcmartin.ca>
	<200606252124.58264.kmh@sonic.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Kai Holthaus <kmh@sonic.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606252124.58264.kmh@sonic.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 25, 2006 at 09:24:57PM -0700, Kai Holthaus wrote:
> Jun 25 21:20:02 obelix kernel: ioctl32(qcset:2965): Unknown cmd fd(3) 
> cmd(403c7601){00} arg(c05cd808) on /dev/video0
> 

On a first look, it sounds like the driver is not properly handling
compat_ioctl (32bit ioctls on a 64bit kernel).

I can try to take a look sometime this week, unless someone else
beats me to it.

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
