Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 1 Apr 2003 22:19:38 -0700
To: "FUHRMAN,SCOTT (HP-Boise,ex1)" <scott.fuhrman@hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Sound on C3000
Message-ID: <20030402051938.GA24936@dsl2.external.hp.com>
References: <25C4C6009B5BD5118FF30003470BF7F503501C63@xboi04.boi.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <25C4C6009B5BD5118FF30003470BF7F503501C63@xboi04.boi.hp.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Tue, Apr 01, 2003 at 01:42:40PM -0500, FUHRMAN,SCOTT (HP-Boise,ex1) wrote:
> I ham enjoying a C3000 (400MHz) machine running hppa Debian, with kernel
> 2.4.20-32.
> Everything is working except the sound.  Sound server can start up, but
> does not have a device to output to.  

As randolph pointed out, you need to "modprobe ad1889".
If that doesn't work, apt-get the kernel source and rebuild
with ad1889 if you are determined to have a go at it.

ad1889 driver "works" if you use a very low standard to define "working".
ad1889 only takes .wav format input at 48Khz. I forget the command
line for mpg321 to directed mpg321 to spew .wav format directly
at the /dev/audio device. And when playing mp3s, I wouldn't stress
the machine with other workloads while it's running.

grant
