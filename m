Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8669B483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 15:59:22 -0700 (MST)
Date: Mon, 10 Nov 2003 23:54:34 +0100
To: Mike Frysinger <vapier@gentoo.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] framebuffer drawing incorrectly ?
Message-ID: <20031110225434.GA27176@solo.franken.de>
References: <200311101646.55611.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200311101646.55611.vapier@gentoo.org>
From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Nov 10, 2003 at 04:46:22PM -0500, Mike Frysinger wrote:
> the frame buffer draws all messed up however ... it only draws on the right 
> quarter of the screen ... the rest of the screen still contains the buffered 

try to turn off double buffering.

> or is the fbdriver the only way i can get X and running ?

yes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
