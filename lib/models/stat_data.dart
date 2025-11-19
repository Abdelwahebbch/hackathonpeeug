import 'package:hackathonpeeug/models/entrepreneur_model.dart';
import 'package:hackathonpeeug/models/structure.dart';

List<Structure> structures = [
  Structure(
    name: "IdeaLab Center",
    shortDesc: "Cherche idées en énergies renouvelables",
    longDescription:
        "Cette structure recherche des idées innovantes dans le domaine des énergies renouvelables : solaire, éolien, optimisation énergétique et solutions pour réduire la consommation.",
    services: "Ateliers d’idéation, validation technique",
    contact: "contact@idealab.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "Creativity Hub",
    shortDesc: "Recherche idées dans l’éducation digitale",
    longDescription:
        "Creativity Hub cherche à financer des idées liées à l’éducation numérique : plateformes d’apprentissage, outils pédagogiques interactifs et solutions pour l’école du futur.",
    services: "Workshops, design thinking",
    contact: "hello@creahub.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "Future Ideas",
    shortDesc: "Cherche idées dans la santé numérique",
    longDescription:
        "Future Ideas veut financer des solutions smart-health : téléconsultation, suivi intelligent, e-santé et optimisation du parcours patient.",
    services: "Études sectorielles, coaching",
    contact: "info@futureideas.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "ThinkStart",
    shortDesc: "Recherche idées dans l’agriculture intelligente",
    longDescription:
        "ThinkStart vise les idées d'agritech : irrigation intelligente, drones agricoles, monitoring des cultures et optimisation des rendements.",
    services: "Analyse marché, prototypage rapide",
    contact: "contact@thinkstart.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "InnovX",
    shortDesc: "Cherche idées IA & automations",
    longDescription:
        "InnovX finance des idées utilisant l’intelligence artificielle : automatisation, reconnaissance d’images, agents intelligents ou optimisation prédictive.",
    services: "Innovation technologique",
    contact: "team@innovx.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "BoostIdea",
    shortDesc: "Recherche solutions pour l’économie circulaire",
    longDescription:
        "BoostIdea cherche à financer des projets visant le recyclage, la réutilisation, la réduction des déchets et la valorisation des matériaux.",
    services: "Coaching, diagnostic environnemental",
    contact: "support@boostidea.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "Concept Forge",
    shortDesc: "Cherche concepts pour améliorer la mobilité",
    longDescription:
        "Concept Forge s'intéresse aux idées liées à la mobilité intelligente : transport partagé, optimisation des trajets, apps de transport.",
    services: "Modélisation d’idée",
    contact: "contact@conceptforge.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "IdeaFlow",
    shortDesc: "Recherche idées dans le tourisme intelligent",
    longDescription:
        "IdeaFlow veut financer des solutions pour moderniser le tourisme : guides intelligents, gestion digitale, expériences immersives.",
    services: "Analyse concurrentielle",
    contact: "hello@ideaflow.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "VisionLab",
    shortDesc: "Cherche idées dans l’artisanat modernisé",
    longDescription:
        "VisionLab finance des idées visant à digitaliser et valoriser l'artisanat : plateformes, marketplaces, traçabilité.",
    services: "Vision mapping",
    contact: "team@visionlab.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "IdeaGenesis",
    shortDesc: "Recherche idées pour l’inclusion sociale",
    longDescription:
        "IdeaGenesis soutient les projets visant à réduire les inégalités : accès à l’emploi, soutien aux personnes vulnérables.",
    services: "Coaching, faisabilité",
    contact: "genesis@ideas.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "StartMind",
    shortDesc: "Cherche idées pour le digital RH",
    longDescription:
        "StartMind finance des solutions pour moderniser les ressources humaines : recrutement intelligent, management digital, suivi performance.",
    services: "Sessions créativité",
    contact: "contact@startmind.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "IdeaBridge",
    shortDesc: "Recherche solutions smart-city",
    longDescription:
        "IdeaBridge est orientée vers les idées pour villes intelligentes : sécurité, gestion d’énergie, mobilité, données urbaines.",
    services: "Études marché",
    contact: "info@ideabridge.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "SparkZone",
    shortDesc: "Cherche idées dans le divertissement digital",
    longDescription:
        "SparkZone se concentre sur les projets gaming, AR/VR, plateformes de contenu interactif.",
    services: "Simulations marché",
    contact: "spark@zone.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "IdeaPilot",
    shortDesc: "Recherche idées fintech",
    longDescription:
        "IdeaPilot veut financer des projets fintech : paiement digital, micro-financement, gestion financière intelligente.",
    services: "Tests rapides",
    contact: "pilot@ideas.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "InspireLab",
    shortDesc: "Cherche idées environnementales",
    longDescription:
        "InspireLab finance des solutions pour protéger l’environnement : monitoring, réduction CO₂, nettoyage intelligent.",
    services: "Mind maps",
    contact: "inspire@lab.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "IdeaZone",
    shortDesc: "Recherche idées sport & bien-être",
    longDescription:
        "IdeaZone soutient des projets liés au bien-être : apps fitness, nutrition intelligente, coaching sportif digital.",
    services: "Guides méthodologiques",
    contact: "support@ideazone.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "ProtoThink",
    shortDesc: "Cherche idées IoT & objets connectés",
    longDescription:
        "ProtoThink veut financer des objets intelligents : capteurs, domotique, sécurité connectée.",
    services: "Concept sketching",
    contact: "team@protothink.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "IdeaSpark Academy",
    shortDesc: "Recherche idées dans la formation professionnelle",
    longDescription:
        "IdeaSpark Academy soutient des solutions pour améliorer la formation : simulateurs, plateformes, apprentissage pratique.",
    services: "Formations",
    contact: "academy@ideaspark.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "BlueSky Factory",
    shortDesc: "Recherche idées dans la créativité digitale",
    longDescription:
        "BlueSky Factory soutient les projets créatifs : design, production numérique, culture digitale.",
    services: "Sessions blue-sky thinking",
    contact: "contact@bluesky.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
  Structure(
    name: "OpenIdea Space",
    shortDesc: "Cherche idées pour l’économie locale",
    longDescription:
        "OpenIdea Space finance des idées renforçant la région : commerce local, agriculture, tourisme, initiatives communautaires.",
    services: "Communauté, échanges d’idées",
    contact: "team@openidea.tn",
    type: StructureInterest.service,
    status: OpportunityStatus.pending,
  ),
];
