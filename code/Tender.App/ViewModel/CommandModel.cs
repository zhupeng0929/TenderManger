// ***********************************************************************
// Assembly         : Tender.App
// Author           : zhu.peng
// Created          : 09-05-2016
//
// Last Modified By : zhu.peng
// Last Modified On : 09-05-2016
// Contact : Microsoft
// File: CommandModel.cs
// ***********************************************************************

using OptimaJet.Workflow.Core.Model;

namespace Tender.App.ViewModel
{
    /// <summary>
    /// workflow命令
    /// </summary>
    public class CommandModel
    {
        public string Key { get; set; }
        public string Value { get; set; }
        public TransitionClassifier Classifier { get; set; }
    }
}