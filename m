From: "rubisher" <rubisher@scarlet.be>
Subject: Re: parisc compile error
Date: Mon, 18 Feb 2008 11:32:58 +0100
Message-ID: <JWFJYY$FFD787B99A1F5B88A6B9433FC2F06B18@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "kyle" <kyle@mcmartin.ca>, "clameter" <clameter@sgi.com>,
	"bunk" <bunk@kernel.org>, "kyle" <kyle@parisc-linux.org>,
	"matthew" <matthew@wil.cx>, "grundler" <grundler@parisc-linux.org>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"rubisher" <rubisher@scarlet.be>
To: "kyle" <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, Feb 13, 2008 at 01:42:10PM +0100, rubisher wrote:
> >
> 
> Can I get your Signed-off-by for this, Joel? (I assume you are Joel :)
> 
Yes the previous account seems to be a bit old and look more and more like a
gc; I so take the opportunity of ml's change to use another pseudo ;-)

That said those 2 hunks help build (even boot my 32bit up kernel on b2k and
d380 boxes):

Signed-off-by: Joel Soete <soete dot joel at scarlet dot be>

(any advise is welcome obviously ;-)

r.

> cheers, Kyle
> 
> >     - some lake of changes of kset to kobj:
> > --- ./drivers/parisc/pdc_stable.c.Orig	2008-01-28 07:09:26.000000000 +0000
> > +++ ./drivers/parisc/pdc_stable.c	2008-02-13 11:22:16.000000000 +0000
> > @@ -829,7 +829,7 @@
> >  				   struct kobj_attribute *attr,
> >  				   const char *buf, size_t count)
> >  {
> > -	return pdcs_auto_write(kset, attr, buf, count, PF_AUTOBOOT);
> > +	return pdcs_auto_write(kobj, attr, buf, count, PF_AUTOBOOT);
> >  }
> >  
> >  /**
> > @@ -845,7 +845,7 @@
> >  				     struct kobj_attribute *attr,
> >  				     const char *buf, size_t count)
> >  {
> > -	return pdcs_auto_write(kset, attr, buf, count, PF_AUTOSEARCH);
> > +	return pdcs_auto_write(kobj, attr, buf, count, PF_AUTOSEARCH);
> >  }
> >  
> >  /**
> > @@ -1066,7 +1066,7 @@
> >  	}
> >  
> >  	/* Don't forget the root entries */
> > -	error = sysfs_create_group(stable_kobj, pdcs_attr_group);
> > +	error = sysfs_create_group(stable_kobj, &pdcs_attr_group);
> >  
> >  	/* register the paths kset as a child of the stable kset */
> >  	paths_kset = kset_create_and_add("paths", NULL, stable_kobj);
> > === <> ===
> > 
> > And the kernel build, but I don't yet try to boot it...
> > 
> > Hth,
> > r.
> > ---
> > Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
> > http://www.scarlet.be/
> > 
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
---
Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
http://www.scarlet.be/
