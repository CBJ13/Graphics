using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.MaterialGraph;

namespace UnityEditor.MaterialGraph.Drawing
{
    [Serializable]
    class RemapContolPresenter : GraphControlPresenter
    {
        public override void OnGUIHandler()
        {
            base.OnGUIHandler();

            var remapNode = node as MasterRemapNode;
            if (remapNode == null)
                return;

            remapNode.remapGraphAsset = (MasterRemapGraphAsset)EditorGUILayout.MiniThumbnailObjectField(
                new GUIContent("Remap"),
                remapNode.remapGraphAsset,
                typeof(MasterRemapGraphAsset), null);
        }

        public override float GetHeight()
        {
            return EditorGUIUtility.singleLineHeight + 2 * EditorGUIUtility.standardVerticalSpacing;
        }
    }

    public class MasterRemapNodeView : MaterialNodeView
    {
        protected override IEnumerable<GraphControlPresenter> GetControlData()
        {
            var instance = ScriptableObject.CreateInstance<RemapContolPresenter>();
            instance.Initialize(node);
            return new List<GraphControlPresenter> { instance };
        }
    }
}
