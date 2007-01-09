From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Mon, 8 Jan 2007 22:47:31 -0500
Message-ID: <20070109034731.GD1065__47385.1251685575$1416624260$gmane$org@athena.road.mcmartin.ca>
References: <119aab440701081830o2d242fe9g806108c74c798726@mail.gmail.com>
	<200701090315.l093F1fI015830@hiauly1.hia.nrc.ca>
	<119aab440701081939l2c8dc081nc48774f2e5fcb893@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org,
 T-Bone@parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440701081939l2c8dc081nc48774f2e5fcb893@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 08, 2007 at 10:39:58PM -0500, Carlos O'Donell wrote:
> This is linuxthreads. One thread is the manager, the other thread is
> doing the real work. You *must* find out why killing that thread
> crashes the system. That is clearly a kernel bug.
> 
> The stuck process could be a compiler, java, or glibc bug.
> 

echo p >/proc/sysrq-trigger or
echo t >/proc/sysrq-trigger

Would probably yield some useful information if the fucked process is still
being scheduled.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
