From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: Re: [PATCH 32/66] arch/parisc/include/asm/parport.h: Checkpatch
	cleanup
Date: Sun, 28 Feb 2010 14:54:26 +0100
Message-ID: <9cdbb57f1002280554u2f06ce7g86cfef6eeb3abc0d@mail.gmail.com>
References: <1267289508-31031-1-git-send-email-andrea.gelmini@gelma.net>
	 <1267289508-31031-33-git-send-email-andrea.gelmini@gelma.net>
	 <7d01f9f01002271418j185821a3h447c89a43406254d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-kernel@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f01002271418j185821a3h447c89a43406254d@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

2010/2/27 Thibaut VARENE <T-Bone@parisc-linux.org>:

Hi Thubaut,
   thanks a lot for you answer.

> This looks very much in contradiction with CodingStyle, since
> parport_pc_find_nonpci_ports() is a function, and it's not a fix for
> the quoted "WARNING". I'm guessing this wasn't intended the way it is.

My fault. I'll look at checkpatch.pl regexp to resolve false positive
(I've found a few other regressions).

Thanks again,
Andrea
