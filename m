Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc3-hem11-4-cust123.bre.cable.ntl.com [213.107.179.123])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1EE6F482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 29 Jul 2002 05:31:47 -0600 (MDT)
Date: Mon, 29 Jul 2002 11:28:28 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Stephan Trajkoff <stephan@itp.bg>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cannot compile kernel
Message-ID: <20020729102827.GF29996@sleepie.demon.co.uk>
References: <3D44F776.6090309@itp.bg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D44F776.6090309@itp.bg>
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

On Mon, Jul 29, 2002 at 11:06:14AM +0300, Stephan Trajkoff wrote:
> Hello, it is my config from pa54
> I tried this on pa59 and again kernel don't want to compile
> Please help me

Switch off CONFIG_FBCON_ADVANCED.

drivers/video/Config.in is broken, it only does

  if [ "$CONFIG_FB_STI" = "y" ]; then
    define_tristate CONFIG_FBCON_STI y
  fi

if CONFIG_FBCON_ADVANCED != y

Richard
