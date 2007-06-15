From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: [parisc-linux] Re: [BUG] XFS broken (again) on parisc
Date: Fri, 15 Jun 2007 17:24:16 +0200
Message-ID: <7d01f9f00706150824k479bfea7n1e8340ac3f0322ef__14779.9695762389$1416624394$gmane$org@mail.gmail.com>
References: <7d01f9f00706100551r57e240a2u510709668f146c03@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
To: "Parisc List" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00706100551r57e240a2u510709668f146c03@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 6/10/07, Thibaut VARENE <T-Bone@parisc-linux.org> wrote:

> That happens on 64bit SMP. I'll investigate more later on. According
> to Guy Martin, this doesn't  happen on UP kernels.

I could actually corrupt an XFS fs on 32bit UP. Dunno if that bug is
related (I suspect it is). Random corruption will appear after a while
on a freshly created XFS fs, but there's a simple testcase to show
corruption actually taking place immediately:

mkfs.xfs <partition>
xfs_logprint <partition> -> the log is OK
mount <partition>
xfs_logprint <partition> -> the log is corrupted

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
