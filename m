From: Helge Deller <helge.deller@steuerkanzlei-deller.de>
Subject: Re: shmctl() broken on 64bit kernel
Date: Fri, 15 Oct 2010 23:15:38 +0200
Message-ID: <4CB8C47A.4090507@steuerkanzlei-deller.de>
References: <4CB8C1E5.2090609@steuerkanzlei-deller.de> <20101015211227.GK8332@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101015211227.GK8332@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

  On 10/15/2010 11:12 PM, Kyle McMartin wrote:
> On Fri, Oct 15, 2010 at 11:04:37PM +0200, Helge Deller wrote:
>>   32bit shmctl() syscall is broken on the 64bit parisc kernel.
>>
> Have you had a chance to look at the patch you posted a few weeks ago
> about the SHM_INFO breakage? I suspect it fixes this as well?
>
> I think plucking the sparc64 or ppc64 structs should be ok, I don't
> think there's any alignment differences offhand.

heh - I completely forgot I did sent the patch that time.... :-)
Anyway, no I didn't tested further yet (due to lack of time).

Helge
