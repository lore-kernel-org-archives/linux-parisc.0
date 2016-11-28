From: Meelis Roos <mroos@linux.ee>
Subject: Re: Aw: Re: parsic: strange boot crash on a500
Date: Mon, 28 Nov 2016 22:23:42 +0200 (EET)
Message-ID: <alpine.LRH.2.20.1611282220060.12618@math.ut.ee>
References: <alpine.LRH.2.20.1611260142170.9292@math.ut.ee> <e8a4822d-bd78-7d5a-9c4b-b515b6fa8eb1@gmx.de> <alpine.LRH.2.20.1611272329430.19497@math.ut.ee> <3aa51712-b586-aefc-8e1f-b81b97c0729a@gmx.de> <alpine.LRH.2.20.1611280013540.19497@math.ut.ee>
 <trinity-e31b21fb-9eb0-43ac-9d20-c8882740e7d6-1480347397040@3capp-gmx-bs03> <trinity-2cc16b5d-53b2-4332-8a92-566526865345-1480347604360@3capp-gmx-bs71> <alpine.LRH.2.20.1611282036240.11649@math.ut.ee> <02c86f80-c5c8-c652-21b4-2a32d51c15fe@gmx.de>
 <98c1d3ba-53be-57f6-5a06-5c4895c4bf6c@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <98c1d3ba-53be-57f6-5a06-5c4895c4bf6c@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The only differences I currently see between your and my setup are:
> 1. My palo partition contains a vmlinux file (you need to add a vmlinux file to your /etc/palo.conf file and rerun "palo -v").

I pondered about that - what do you mean...

and then it dawned on me - I have wrong symlink under /boot. On most 
machines I have symlink named test that points to my latest test kernel, 
but on parisc I had default vmlinux since installerkenl worked out of 
the box with it. So it just worked, until I removed vmlinux and created 
"test" symlink by mistake whern testing 4.9-rc*. Now I recreated the 
vmlinux symlink and the new kernels just work.

So it was a bad user error my side, probably from staying up too late 
some day :)

However, palo seems to miss error handling in that case.

> 2. In my setup I didn't added "console=ttyS0". palo does that by itself if you run via serial console.

Yes, I removed it and serial console just keeps working.

Thank you!

-- 
Meelis Roos (mroos@linux.ee)
