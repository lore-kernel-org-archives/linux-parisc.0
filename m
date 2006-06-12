From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Sun, 11 Jun 2006 20:54:15 -0400 (EDT)
Message-ID: <200606120054.k5C0sF1m025654@hiauly1.hia.nrc.ca>
References: <119aab440606111734j3226f013l78e4c2fa22c08709@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440606111734j3226f013l78e4c2fa22c08709@mail.gmail.com>
	from "Carlos O'Donell" at Jun 11, 2006 08:34:33 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On 6/11/06, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > (gdb) p *spinlock
> > $10 = {lock = {0, 0, 0, 0}} <== we would see some ones if initialized
> > So, I believe the value for spinlock in the backtrace.  Thus, this is
> > probably a libgfortran issue.

In the first call to st_write_done, I see:

(gdb) p *((st_parameter_dt *)$r26)->u.p.current_unit
$38 = {unit_number = -1, s = 0x193248, left = 0x0, right = 0x0, priority = 0,
  read_bad = 1, current_record = 1, endfile = NO_ENDFILE, mode = WRITING,
  flags = {access = ACCESS_SEQUENTIAL, action = ACTION_READWRITE,
  blank = BLANK_NULL, delim = DELIM_NONE, form = FORM_FORMATTED,
  is_notpadded = 0, position = POSITION_ASIS, status = STATUS_UNSPECIFIED,
  pad = PAD_YES, convert = CONVERT_NATIVE}, recl = 36, last_record = 0,
  maxrec = 0, bytes_left = 0, lock = {__m_reserved = 0, __m_count = 0,
  __m_owner = 0x0, __m_kind = 0, __m_lock = {__spinlock = {lock = {0, 0, 0,
  0}}, __status = 0}}, waiting = 0, closed = 0, ls = 0x0, rank = 0,
  file_len = 0, file = 0x0}

The only unit numbers that I see being initialized are 5, 6 and 0.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
