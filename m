From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Status update on NPTL
Date: Sat, 11 Jul 2009 17:06:52 -0400
Message-ID: <119aab440907111406g6ac13645h6c9fc2174cc19ad2@mail.gmail.com>
References: <119aab440907110717q1c55d329jbdf17924e0929804@mail.gmail.com>
	 <20090711204625.GA31925@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <20090711204625.GA31925@bombadil.infradead.org>
Resent-Message-ID: <XptSNNHomKE.A.D5G.97PWKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Sat, Jul 11, 2009 at 4:46 PM, Kyle McMartin<kyle@mcmartin.ca> wrote:
> On Sat, Jul 11, 2009 at 10:17:14AM -0400, Carlos O'Donell wrote:
>> I've been investigating the crashes, but because of problems with gdb
>> and strace I've had to take it slow. Kyle, I have your recent strace
>> patches in my queue to test. Thanks for that.
>>
>
> Which ones? It would be good if some heavy debugger users could test the
> changes in the tracehook branch with coredumps... I'll try to do a build
> of strace using PTRACE_{GET,SET}REGS instead of PEEK & POKE for extra
> testing there as well, but it seems to be working well enough for me.

If I understand correctly you added PTRACE_GETREGS and PTRACE_SETREGS
with this patch:
http://permalink.gmane.org/gmane.linux.ports.parisc/1882

Then you posted a patch to strace to use PTRACE_GETREGS and
PTRACE_SETREGS with this patch:
http://www.dailykos.com/storyonly/2009/7/10/752179/-What-staring-at-an-ass-really-looks-like

Is my understanding correct? I would need a kernel patch, an strace
patch, and then strace would be using PTRACE_GETREGS and
PTRACE_SETREGS?

How is the debugger involved in this?

Cheers,
Carlos.
