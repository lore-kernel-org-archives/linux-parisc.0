Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 3 Apr 2003 14:55:15 -0700
To: "Beerse, Corn?" <c.beerse@torex-hiscom.nl>
Cc: 'Joel Soete' <jsoe0708@tiscali.be>,
	Derek Ellis <Derek.Ellis@us.fortis.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] soft power and power light on 712/60
Message-ID: <20030403215515.GA20457@dsl2.external.hp.com>
References: <03Apr2.105446cest.119062@ns.hiscom.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <03Apr2.105446cest.119062@ns.hiscom.nl>
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

On Wed, Apr 02, 2003 at 10:35:56AM +0200, "Beerse, Corn?" wrote:
> The only reason I can imagine it should not work is addressing the
> boot-image from the boot-prom.
> 
> Or else, it should not be called scsi...

You are mixing up marketing, implementation, and "supported".
HP decided the older box wasn't worth supporting.
I'l hazard a guess the "upgrade" would not generate enough revenue
to offset the additional qualification/inventory/support burden.

And SCSI implementations are not always compatible because they
don't implement all the same features. Delayed spinup and
Target-Initiated Syncronous Negotiation are two SCSI disk features
that early host controller firmware typically have trouble with.

grant
