From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: Another LCD tweak
Date: Wed, 30 Mar 2005 11:15:03 -0700
Message-ID: <20050330181503.GA315@colo.lackof.org>
References: <20050328065020.A8616496334@palinux.hppa>
	<42480345.7070607@tiscali.be>
	<20050328172730.GB10159@colo.lackof.org>
	<200503291942.45308.dmp@davidmpye.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: David Pye <dmp@davidmpye.dyndns.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503291942.45308.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Mar 29, 2005 at 07:42:41PM +0100, David Pye wrote:
> Sorry to keep sending these in, but:

np

> I found an issue where lcd_print tries to manipulate the work queue after it 
> has been destroyed.  Setting it to NULL after destroying it fixes this.

committed.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
