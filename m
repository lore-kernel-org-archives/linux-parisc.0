From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] More from the TLS glibc front.
Date: Fri, 15 Apr 2005 10:34:38 -0400
Message-ID: <20050415143437.GO26980@baldric.uwo.ca>
References: <20050409050558.GL1833@baldric.uwo.ca>
	<20050410104403.GK6987@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050410104403.GK6987@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Apr 10, 2005 at 03:44:03AM -0700, Randolph Chung wrote:
> I find some other issues with the glibc build. Carlos, a few of your
> patches are malformed. They have CVS conflict markers in them.. :)

Oh, yes. I'm not always as careful as I want to be with that patch
generation. I fix the upstream glibc problems too fast, and the update
script does a 'cvs up' and then generates patches. Not always optimal.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
