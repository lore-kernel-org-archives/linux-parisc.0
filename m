Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-2.cisco.com (sj-msg-core-2.cisco.com [171.69.24.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6780D482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jan 2002 13:03:00 -0700 (MST)
Date: Sat, 19 Jan 2002 12:02:55 -0800
From: Christian Suder <csuder@cisco.com>
To: "Philipp Schulte" <pschulte@uni-duisburg.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Boot console problems
Message-Id: <20020119120255.12b0cd25.csuder@cisco.com>
In-Reply-To: <20020119193343.A876@nepomuk.max.uni-duisburg.de>
References: <20020119193343.A876@nepomuk.max.uni-duisburg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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


Philip,

I'm using the serial console on a 735/125 without any problems. Two possibilities:

Your cable - does it have anything special/wrong on the control signals ? Obviously the basic RX/TX and ground work, how about the other signals (DSR/DTR, RTS/CTS) ?

The console configuration and your terminal program aren't using the same parameters (I assume you are using 9600,n,8,1). Eventually the console has been set to something similar but different. The console and the OS can use different settings, which is why it works from the OS but not at the boot prompt.

	Christian 


On Sat, 19 Jan 2002 19:33:43 +0100
"Philipp Schulte" <pschulte@uni-duisburg.de> wrote:

> Hello,
> I am trying to install parisc-linux on a HP 735. The problem is that I
> can not specify the boot device. I hit ESC during the boot-process and
> I get the menu where I can choose between:
> 
> ---
> a) Boot from specified device
> s) Search fpr bootable devices
> a) Enter boot administration mpde
> x) Exit and continue boot sequence
> ?) Help
> 
> Select from menu:
> ---
> 
> But then nothing happens no matter what key I press. The cursor just
> jumps to the "S" of "Select". Even "? <RETURN>" gives no output at
> all.
> I thought that it might have something to do with my serial console
> but I tried using another PC with minicom and got the same result.
> If I just let the machine boot to HP-UX then everything works fine, I
> can execute commands and stuff.
> Does someone know whats going on here or how to avoid this problem?
> Regards,
> Phil
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
