From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Stop CPUs via PAT firmware before system halt or reboot.
Date: Sun, 14 May 2017 20:42:24 -0400
Message-ID: <267CAD7B-3DB7-457E-8A82-2CFB2FF07587@bell.net>
References: <20170512165513.GA23551@ls3530.fritz.box>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170512165513.GA23551@ls3530.fritz.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-05-12, at 12:55 PM, Helge Deller wrote:

> Dave reported that he had issued a "shutdown -r" and a panic occurred during
> the reboot while all CPUs were still up. After this, stall messages were output
> to console after the firmware version was printed.
> 
> To avoid that issue, add functions to call PAT firmware to stop all CPUs (with
> the exception of the currently running CPU) before a panic reboot or a system
> halt is issued.

This patch causes a problem with "shutdown -h" on my c8000.  After the system prints
the message that it is okay to power off, the front panel LED shows a flashing red, and pressing
the power button once doesn't power the system down.  Pressing it again causes the system
to reboot.

Dave
--
John David Anglin	dave.anglin@bell.net



