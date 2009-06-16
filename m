From: Helge Deller <deller@gmx.de>
Subject: Re: HPPA and Squeeze
Date: Tue, 16 Jun 2009 21:08:37 +0200
Message-ID: <4A37EDB5.2020400@gmx.de>
References: <20090602140734.GC26721@mx0.halon.org.uk> <20090606183600.GA425@lackof.org> <4A31FA76.20103@debian.org> <20090615173102.GC2690@lackof.org> <20090616062531.GA17957@xanadu.blop.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Grant Grundler <grundler@parisc-linux.org>,
 HPPA porters <debian-hppa@lists.debian.org>,
 Debian Release <debian-release@lists.debian.org>,
 admin@debian-ports.org, linux-parisc@vger.kernel.org
To: Lucas Nussbaum <lucas@lucas-nussbaum.net>,
 Carlos O'Donell <carlos@systemhalted.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <20090616062531.GA17957@xanadu.blop.info>
Resent-Message-ID: <J-mIOvCa3BN.A.vYC.L3-NKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On 06/16/2009 08:25 AM, Lucas Nussbaum wrote:
> On 15/06/09 at 11:31 -0600, Grant Grundler wrote:
> PS: if you want an HPPA-specific issue to play with,
> http://experimental.debian.net/fetch.php?&pkg=ruby1.9&ver=1.9.0.1-5&arch=hppa&stamp=1213563978&file=log&as=raw
> might be a good candidate.

In reality it's not (any longer) a hppa specific bug. It's a bug in ruby.
Ruby just relies on NPTL specific behaviour of threads and as such plays mad on LinuxThreads, which we still have active on hppa.
The good thing is, that the NPTL switch-over was started by Carlos, so I expect that this should be fixed when NPTL hits unstable...

Helge
